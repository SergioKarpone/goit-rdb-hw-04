-- 2. Заповнення таблиць тестовими даними

USE LibraryManagement;

INSERT INTO authors (author_name) VALUES
    ('Михайло Коцюбинський'),
    ('Леся Українка')
;

INSERT INTO genres (genre_name) VALUES
    ('Історичний роман'),
    ('Поезія')
;

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
    ('Тіні забутих предків', 1912, 1, 1),
    ('Лісова пісня', 1912, 2, 2)
;

INSERT INTO users (username, email) VALUES
    ('Ivanenko Serhiy', 'ivanenko.serhiy@gmail.com'),
    ('Kovalenko Olena', 'kovalenko.olena@gmail.com')
;

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
    (1, 1, '2026-04-01', '2026-04-15'),
    (2, 2, '2026-04-10',  NULL)        -- на руках
;