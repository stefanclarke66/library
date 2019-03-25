from bottle import get, install, run, request, post, template, static_file
from bottle_sqlite import SQLitePlugin
import datetime
install(SQLitePlugin(dbfile='library.db'))
now = datetime.datetime.now()

@get('/views/<file:path>')
def serve_static(file):
    return static_file(file, root='./views')

@get('/')
def home_page(db):
    return template('Home')

@get('/books')
def books_page(db):
    return template('books', add_remove_message = ' ')

@get('/users')
def users_page(db):
    return template('users', user_message = '')

@get('/in-out', message = '')
def in_out_page(db):
    return template('in-out')

@get('/fines')
def fines_page(db):
    return template('fines')

@get('/categories')
def categories_page(db):
    return template('categories')

@get('/users/search')
def find_page(db):
    return template('find-user', user_list = [], number_results = 0)


@post('/books/add')
def addbook(db):
    title = request.forms.get('add-book-name')
    author_id = request.forms.get('add-author-id')
    genre_id = request.forms.get('add-genre-id')
    description = request.forms.get('add-description')
    goodreads_id = request.forms.get('add-goodreads-id')

    author = db.execute('SELECT * from author WHERE id = ?', (author_id)).fetchall()
    if author == []:
        return template('books', add_remove_message = 'This author does not exist.')

    genre = db.execute('SELECT * from genre WHERE id = ?', (genre_id)).fetchall()
    if genre == []:
        return template('books', add_remove_message = 'This genre does not exist.')
    db.execute('INSERT INTO book (title, author_id, genre_id, description, goodreads_id, in_library) VALUES (?, ?, ?, ?, ?, 0)', (title, author_id, genre_id, description, goodreads_id))
    
    string1 = f'Adding {title}, Author ID: {author_id}, Genre ID: {genre_id}'

    books_db = db.execute('SELECT * FROM book').fetchall()
    books = [p['title'] for p in books_db]

    add_remove_message = string1

    return template('books', add_remove_message = add_remove_message)

@post('/books/remove')
def removebook(db):
    book_id = request.forms.get('remove-book-id')

    book = db.execute('SELECT * from book WHERE id = ?', (book_id,)).fetchone()
    if book == None:
        return template('books', add_remove_message = 'This book does not exist.')

    bookname = book['title']
    db.execute('DELETE from book WHERE id = ?', (book_id,))

    string1 = f'Removing {bookname}, Book ID: {book_id}'
    books_db = db.execute('SELECT * FROM book').fetchall()
    books = [p['title'] for p in books_db]

    add_remove_message = string1

    return template('books', add_remove_message = add_remove_message)

@post('/books/add_author')
def addauthor(db):
    author_first_name = request.forms.get('author-first-name')
    author_second_name = request.forms.get('author-second-name')

    db.execute('INSERT INTO author (first_name, last_name) VALUES (?, ?)', (author_first_name, author_second_name))
    author = db.execute('SElECT * FROM author WHERE id = (SELECT MAX(id) FROM author)').fetchone()
    author_id = author['id']

    add_remove_message = f'Adding Author: {author_first_name} {author_second_name}. Author ID is {author_id}'

    return template('books', add_remove_message = add_remove_message)

@post('/users/add')
def adduser(db):
    user_first_name = request.forms.get('user-first-name-in')
    user_second_name = request.forms.get('user-second-name-in')
    user_dob = request.forms.get('user-age-in')

    db.execute('INSERT INTO user (first_name, second_name, birth_date, fines, admin) VALUES (?, ?, ?, ?, ?)', (user_first_name, user_second_name, user_dob, 0, 0))
    user = db.execute('SElECT * FROM user WHERE id = (SELECT MAX(id) FROM user)').fetchone()
    user_id = user['id']

    user_message = f'Adding user: {user_first_name} {user_second_name}. User ID is {user_id}'

    return template('users', user_message = user_message)

@post('/users/search')
def finduser(db):
    user_id = request.forms.get('search-in')
    results = db.execute('''SElECT * FROM user WHERE(
                                ID = ? OR
                                first_name LIKE ? OR
                                second_name LIKE ?
                                )''', (user_id, f'%{user_id}%', f'%{user_id}%')).fetchall()
    user_list = []
    for user in results:
        user_list.append([user['id'], user['first_name'], user['second_name'], user['fines']])
    number_results = len(user_list)

    return template('find-user', user_list = user_list, number_results = number_results)

@post('/in-out/in')
def check_in(db):
    user_id = request.forms.get('user-id-in')
    book_id = request.forms.get('book-id-in')
    db.execute('UPDATE book SET in_library = 0 WHERE id = ?', (book_id,))
    book = db.execute('SELECT title FROM book WHERE id = ?', (book_id,)).fetchone()
    loan = db.execute('SELECT MAX(id) FROM (SELECT * FROM loan WHERE( book_id = ? AND user_id = ?))', (user_id, book_id)).fetchone()
    id = loan[0]
    db.execute('UPDATE loan SET out = 0 WHERE id = ?', (id,))

    bookname = book['title']
    message = f'Returning {bookname}'
    return template('in-out', message = message)

@post('/in-out/out')
def check_out(db):
    user_id = request.forms.get('user-id-out')
    book_id = request.forms.get('book-id-out')
    time_out = request.forms.get('time-out')
    time_out = int(time_out)
    day_due = datetime.datetime.now() + datetime.timedelta(days = time_out)
    db.execute('UPDATE book SET in_library = 1 WHERE id = ?', (book_id,))
    db.execute('INSERT INTO loan (user_id, book_id, out_date, due_date, out, reserved) VALUES (?, ?, ?, ?, ?, ?) ', (user_id, book_id, datetime.datetime.now(), day_due, 1, 0))
    book_name = db.execute('SELECT * FROM book WHERE id = ?', (book_id)).fetchone()
    book_name = book_name['title']
    message = f'Loaning out {book_name}. Due for return {day_due}'
    return template('in-out', message = message)

@post('/books/search')
def findbook(db):
    book_search = request.forms.get('find-book')
    results = db.execute('''SElECT * FROM book WHERE(
                                ID = ? OR
                                title LIKE ? OR
                                author_id LIKE ?
                                )''', (book_search, f'%{book_search}%', f'%{book_search}%')).fetchall()
    book_list = []
    for book in results:
        author_id = book['author_id']
        author_first_name = db.execute('SELECT first_name FROM author WHERE id = ?', (author_id,)).fetchone()[0]
        author_second_name = db.execute('SELECT last_name FROM author WHERE id = ?', (author_id,)).fetchone()[0]
        author_name = author_first_name + " " + author_second_name
        book_id = book['id']
        if book['in_library'] == 1:
            out = 'Yes'
            loan_id = db.execute('SELECT MAX(id) FROM (SELECT * FROM loan WHERE( book_id = ?))', (book_id,)).fetchone()[0]
            due_date = db.execute('SElECT due_date FROM loan WHERE id = ?', (loan_id,)).fetchone()[0]
            user_rented = db.execute('SElECT user_id FROM loan WHERE id = ?', (loan_id,)).fetchone()[0]
        else:
            out = 'No'
            due_date = ' - '
            user_rented = ' - '
        book_list.append([book['id'], book['title'], book['author_id'], out, author_name, due_date, user_rented])
    number_results = len(book_list)

    return template('find-book', book_list = book_list, number_results = number_results)

@post('/fines/fine')
def fineuser(db):
    user_id = request.forms.get('user-id-in')






    



    





run(host='localhost', port=8080, debug = True)