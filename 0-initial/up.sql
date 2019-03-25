-- SQL ALTER statements for database migration
CREATE TABLE book ( 
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
                )