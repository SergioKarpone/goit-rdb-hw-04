-- 1. Створення схеми та таблиць

-- Створення схеми
DROP SCHEMA IF EXISTS LibraryManagement;
CREATE SCHEMA LibraryManagement
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci
;

USE LibraryManagement;

-- Створення authors
CREATE TABLE authors (
    author_id   INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(150) NOT NULL
) ENGINE = InnoDB
;

-- Створення genres
CREATE TABLE genres (
    genre_id   INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB
;

-- Створення books
CREATE TABLE books (
    book_id          INT AUTO_INCREMENT PRIMARY KEY,
    title            VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id        INT,
    genre_id         INT,
    CONSTRAINT fk_books_author
        FOREIGN KEY (author_id) REFERENCES authors (author_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_books_genre
        FOREIGN KEY (genre_id)  REFERENCES genres (genre_id)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE = InnoDB
;

-- Створення users
CREATE TABLE users (
    user_id  INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email    VARCHAR(150) NOT NULL UNIQUE
) ENGINE = InnoDB
;

-- Створення borrowed_books
CREATE TABLE borrowed_books (
    borrow_id   INT AUTO_INCREMENT PRIMARY KEY,
    book_id     INT NOT NULL,
    user_id     INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_borrow_book
        FOREIGN KEY (book_id) REFERENCES books (book_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_borrow_user
        FOREIGN KEY (user_id) REFERENCES users (user_id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB
;