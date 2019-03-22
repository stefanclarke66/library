from bottle import get, install, run, request, post, template
from bottle_sqlite import SQLitePlugin
install(SQLitePlugin(dbfile='library.db'))


@get('/books/add')
def book_form():
    return '''
        <form action="/books/add" method="post">
            Title: <input name="title" type="text" />
            Author ID: <input name="author_id" type="integer" />
            Genre ID: <input name="genre_id" type="integer" />
            <input value="Go" type="submit" />
        </form>
    '''


@post('/books/add')
def addbook(db):
    title = request.forms.get('title')
    author_id = request.forms.get('author_id')
    genre_id = request.forms.get('genre_id')

    author = db.execute('SELECT * from author WHERE id = ?', (author_id)).fetchall()
    if author == []:
        return 'This author does not exist.'

    genre = db.execute('SELECT * from genre WHERE id = ?', (genre_id)).fetchall()
    if genre == []:
        return 'This genre does not exist.'

    db.execute('INSERT INTO book (title, author_id, genre_id) VALUES (?, ?, ?)', (title, author_id, genre_id))
    
    string1 = f'Adding {title} by {author_id} genre {genre_id}'

    books_db = db.execute('SELECT * FROM book').fetchall()
    books = [p['title'] for p in books_db]

    return  string1 + "------------------------" "BOOKS AVAILABLE: " + ", ".join(books)


@get('/books')
def show_books(db):
    books = db.execute('SELECT * from book').fetchall()

@get('/')
def home_page(db):
    return template('Home')
    



@get('/books/remove')
def book_form():
    return '''
        <form action="/books/remove" method="post">
            Book ID: <input name="book_id" type="integer" />
            <input value="Go" type="submit" />
        </form>
    '''


@post('/books/remove')
def addbook(db):
    book_id = request.forms.get('book_id')

    book = db.execute('SELECT * from book WHERE id = ?', (book_id)).fetchall()

    if book == []:
        return 'This book does not exist.'

    title = db.execute('SELECT title from book WHERE id = ?',(book_id)).fetchone()
    author_id = db.execute('SELECT author_id from book WHERE id = ?',(book_id)).fetchone()
    genre_id = db.execute('SELECT genre_id from book WHERE id = ?',(book_id)).fetchone()
    db.execute('DELETE from book WHERE id = ?', (book_id))
    
    string1 = f'Removing {title} by {author_id} genre {genre_id}'

    books_db = db.execute('SELECT * FROM book').fetchall()
    books = [p['title'] for p in books_db]

    return  string1 + "------------------------" "BOOKS AVAILABLE: " + ", ".join(books)

run(host='localhost', port=8080)