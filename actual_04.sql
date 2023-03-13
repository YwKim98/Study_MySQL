-- 실습 1
CREATE DATABASE bookstore CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE bookstore;
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title varchar(50),
    author_id INT,
    publication_date DATE,
    FOREIGN KEY(author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name varchar(50),
    order_date DATE,
    FOREIGN KEY(book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE
);
DESC authors;
DESC books;
DESC orders;

-- 실습 2
INSERT INTO authors VALUES 
	('1', 'J.K.', 'Rowling', 'jkrowling@gmail.com'),
	('2', 'George', 'Martin', 'grmartin@yahoo.com'),
	('3', 'Stephen', 'Kin', 'sking@hotmail.com');
INSERT INTO books VALUES 
	('1', 'Harry Potter and the Philosopher''s Stone', '1', '1997-06-26'),
	('2', 'A Game of Thrones', '2', '1996-08-06'),
	('3', 'The Shining', '3', '1977-01-28');
INSERT INTO orders VALUES 
	('1', '1', 'John Smith', '2022-02-15'),
	('2', '2', 'Jane Doe', '2022-02-16'),
	('3', '3', 'Bob Johnson', '2022-02-17');
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM orders;
-- 실습 3
-- 1. author_id가 1인 작성자의 이메일을 jkrowling@yahoo.com으로 업데이트하는 SQL 문을 작성합니다.
UPDATE authors SET email = 'jkrowling@yahoo.com' WHERE author_id = '1';
-- 2. books 테이블에서 book_id 2인 책을 삭제하는 SQL 문을 작성합니다.
DELETE FROM books WHERE book_id = '2';
-- 3. 다음 세부 정보가 포함된 새 책을 삽입하는 SQL 문을 작성합니다.
-- 책 ID: 4
-- 제목: 스탠드
-- 저자 ID: 3
-- 발행일자 : 1978-01-01
INSERT INTO books VALUES ('4', '스탠드', '3', '1978-01-01');
-- 4. book_id 1인 책의 출판 날짜를 1997-06-30으로 업데이트하는 SQL 문을 작성하십시오.
UPDATE books SET publication_date = '1997-06-30' WHERE book_id = '1';
-- 5. 022-02-17 이전에 접수된 모든 주문을 삭제하는 SQL 문을 작성합니다.
SET sql_safe_updates=0;
DELETE FROM orders WHERE order_date < '2022-02-17';
-- 6. 다음 세부 정보와 함께 새 주문을 삽입하는 SQL 문을 작성합니다.
-- 주문 ID: 4
-- 책 ID: 1
-- 고객 이름: 사라 존슨
-- 주문일자 : 2022-02-18
INSERT INTO orders VALUES ('4', '1', '사라 존슨', '2022-02-18');
-- 7. order_id가 1인 주문의 고객 이름을 Jack Smith로 업데이트하는 SQL 문을 작성합니다.
UPDATE orders SET customer_name = 'Jack Smith' WHERE order_id = '1';
-- 8. 다음 세부 정보와 함께 새 작성자를 삽입하는 SQL 문을 작성합니다.
-- 저자 ID: 4
-- 이름: 아가사
-- 성: 크리스티
-- 이메일: agatha.christie@example.com
INSERT INTO authors VALUES ('4', '아가사', '크리스티', 'agatha.christie@example.com');
-- 9. author_id 2인 작성자의 성을 Martinez로 업데이트하는 SQL 문을 작성합니다.
UPDATE authors SET last_name = 'Martinez' WHERE author_id = '2';
-- 10. author_id 3인 저자가 쓴 모든 책을 삭제하는 SQL 문을 작성합니다.
DELETE FROM authors WHERE author_id = '3';