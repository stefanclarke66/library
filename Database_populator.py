from bottle import get, install, run
from bottle_sqlite import SQLitePlugin

import sqlite3
conn = sqlite3.connect('library.db')
conn.execute(""" CREATE TABLE book ( 
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                title VARCHAR(255) NOT NULL,
                author_id INTEGER NOT NULL,
                genre_id INTEGER NOT NULL,
                description VARCHAR(1020) NULL,
                goodreads_id INTEGER NULL,
                reserved_by INTEGER NULL,
                in_library INTEGER NOT NULL,
                borrower INTEGER NULL,

                FOREIGN KEY (author_id) REFERENCES author(id),
                FOREIGN KEY (genre_id) REFERENCES genre(id),
                FOREIGN KEY (borrower) REFERENCES user(id)
                );""")

conn.execute(""" CREATE TABLE user (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                first_name VARCHAR(255) NOT NULL,
                second_name VARCHAR(255) NOT NULL,
                birth_date DATE NOT NULL,
                fines INTEGER NOT NULL,
                admin BOOLEAN NOT NULL
                );""")

conn.execute(""" CREATE TABLE loan (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                book_id INTEGER NOT NULL,
                out_date DATE NULL,
                due_date DATE NULL,
                out BOOLEAN NOT NULL,
                reserved BOOLEAN NOT NULL,

                FOREIGN KEY (user_id) REFERENCES user(id),
                FOREIGN KEY (book_id) REFERENCES book(id)
                );""")

conn.execute("""CREATE TABLE author (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                first_name VARCHAR(255) NOT NULL,
                last_name VARCHAR(255) NOT NULL,
                description VARCHAR(1020) NULL
                );""")

conn.execute("""CREATE TABLE genre (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                name VARCHAR(255) NOT NULL UNIQUE
                );""")

conn.execute("INSERT INTO genre (name) VALUES ('Mathematics');")
conn.execute("INSERT INTO author (first_name, last_name) VALUES ('Ekkehard', 'Kopp');")
conn.execute("INSERT INTO book (title, author_id, genre_id, in_library) VALUES ('Measure, Integral and Probability', 1, 1, 1);")

conn.execute("INSERT INTO user (first_name, second_name, birth_date, fines, admin) VALUES ('Stefan', 'Clarke', '1998-09-02', 0, 1);")
conn.execute("INSERT INTO loan (user_id, book_id, out_date, due_date, out, reserved) VALUES (1, 1, '2019-03-19', '2019-03-30', 1, 0);")
                
conn.commit()
