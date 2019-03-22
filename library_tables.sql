CREATE TABLE book (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	title VARCHAR(255) NOT NULL,
	author_id INTEGER NOT NULL,
	genre_id INTEGER NOT NULL,
	description VARCHAR(1020) NULL,
	goodreads_id INTEGER NULL,
	reserved_by INTEGER NULL,

	FOREIGN KEY (author_id) REFERENCES author(id),
	FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE user (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name VARCHAR(255) NOT NULL,
	second_name VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	fines INTEGER NOT NULL,
	admin BOOLEAN NOT NULL
);

CREATE TABLE loan (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	book_id INTEGER NOT NULL,
	out_date DATE NULL,
	due_date DATE NULL,
	out BOOLEAN NOT NULL,
	reserved BOOLEAN NOT NULL,

	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (book_id) REFERENCES book(id)
);

CREATE TABLE author (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	description VARCHAR(1020) NULL
);

CREATE TABLE genre (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO genre (name) VALUES ('Mathematics');
INSERT INTO author (first_name, last_name) VALUES ('Ekkehard', 'Kopp');
INSERT INTO book (title, author_id, genre_id) VALUES ('Measure, Integral and Probability', 1, 1);

INSERT INTO user (first_name, second_name, birth_date, fines, admin) VALUES ('Stefan', 'Clarke', '1998-09-02', 0, True);
INSERT INTO loan (user_id, book_id, out_date, due_date, out, reserved) VALUES (1, 1, '2019-03-19', '2019-03-30', 1, 0);