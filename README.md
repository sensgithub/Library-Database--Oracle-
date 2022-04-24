# SQL project for a Library
A project from my university which sets a Library database (without UI). <br> <br>
_If you like this project, please leave me a star._ &#9733;

# Creating tables
CREATE TABLE Book
(
book_id INTEGER NOT NULL,
book_name VARCHAR(20),
author_id INT,
year_release VARCHAR(20),
publisher_id INT,
genre_id INT,
PRIMARY KEY(book_id)
);

CREATE TABLE Author
(
author_id INT NOT NULL,
author_name VARCHAR(20),
PRIMARY KEY(author_id)
);

CREATE TABLE Reader
(
reader_id INT NOT NULL,
reader_phone_number VARCHAR(20),
reader_name VARCHAR(20),
PRIMARY KEY(reader_id)
);

CREATE TABLE Borrowing
(
book_id INT,
reader_id INT,
employee_id INT,date_borrow DATE,
date_period DATE
);

CREATE TABLE Genre
(
genre_id INT,
genre_name VARCHAR(20),
PRIMARY KEY(genre_id)
);

CREATE TABLE Employee
(
employee_id INT NOT NULL,
position_id INT,
employee_name VARCHAR(20),
phone_number VARCHAR(20),
PRIMARY KEY(employee_id)
);

CREATE TABLE Position
(
position_id INT NOT NULL,
position_name VARCHAR(20),
PRIMARY KEY(position_id)
);

CREATE TABLE Publisher
(
publisher_id INT NOT NULL,
publisher_name VARCHAR(20),
PRIMARY KEY(publisher_id)
); 

# Adding Foreign keys

ALTER TABLE Book
ADD CONSTRAINT Book_Genre_FK
FOREIGN KEY (genre_id)
REFERENCES Genre(genre_id);

ALTER TABLE Book
ADD CONSTRAINT Book_Publisher_FK
FOREIGN KEY (publisher_id)
REFERENCES Publisher(publisher_id);

ALTER TABLE Book
ADD CONSTRAINT Book_Author_FK
FOREIGN KEY (author_id)
REFERENCES Author(author_id);

ALTER TABLE Employee
ADD CONSTRAINT Employee_Position_FK
FOREIGN KEY (position_id)
REFERENCES Position(position_id);

ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Book_FK FOREIGN KEY (book_id) REFERENCES Book(book_id);

ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id);

ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Reader_FK FOREIGN KEY (reader_id) REFERENCES Reader(reader_id);

# Inserting into the tables

INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(1,'Georgi', '0896668787');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(2,'Vasil', '0874510607');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(3,'Stoyan', '0936572134');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(4,'Boris', '0898236511');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(5,'Hristo', '0998236533');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(6,'Atanas', '0898236539');
INSERT INTO reader (reader_id,reader_name,reader_phone_number)
VALUES(7,'Valeria', '0885536739');

INSERT INTO position (position_id,position_name)
VALUES(100,'Clerk');
INSERT INTO position (position_id,position_name)
VALUES(50,'Librarian');
INSERT INTO position (position_id,position_name)
VALUES(200,'Receptionist');
INSERT INTO position (position_id,position_name)
VALUES(500,'Janitor');
INSERT INTO position (position_id,position_name)
VALUES(20,'Staff Executive');

INSERT INTO employee (employee_id,position_id,employee_name, phone_number)
VALUES(1,100,'Daniel', '0988745130');
INSERT INTO employee (employee_id,position_id,employee_name, phone_number)
VALUES(2,200,'Hristo', '0888957540');
INSERT INTO employee (employee_id,position_id,employee_name, phone_number)
VALUES(3,500,'Kaloyan', '0885331567');
INSERT INTO employee (employee_id,position_id,employee_name, phone_number)
VALUES(4,20,'Trendafil', '0885331867');
INSERT INTO employee (employee_id,position_id,employee_name, phone_number)
VALUES(5,50,'Maria', '0894121868');

INSERT INTO publisher (publisher_id,publisher_name)
VALUES(200,'Ciela'); 
INSERT INTO publisher
VALUES(300,'Helikon');
INSERT INTO publisher
VALUES(400,'Colibri');

INSERT INTO genre (genre_id,genre_name)
VALUES(1,'Horror');
INSERT INTO genre
VALUES(2,'Thriller');
INSERT INTO genre
VALUES(3,'Fantasy');
INSERT INTO genre
VALUES(4,'Sci-fi');
INSERT INTO genre
VALUES(5,'Historical');
INSERT INTO genre
VALUES(6,'Novel');
INSERT INTO genre
VALUES(7,'Poem');
INSERT INTO genre
VALUES(8,'Drama');

INSERT INTO author (author_id,author_name)
VALUES(50,'Orwell');
INSERT INTO author
VALUES(60,'Hemingway');
INSERT INTO author
VALUES(70,'Pushkin');
INSERT INTO author
VALUES(80,'Fitzgerald');
INSERT INTO author
VALUES(90,'Shakespeare');

INSERT INTO Book (book_id,book_name,author_id,year_release,publisher_id,genre_id)
VALUES(10,'1984',50,'2016', 200, 4);
INSERT INTO Book
VALUES(20,'A Farewell to Arms',60,'2014',300,6)
INSERT INTO Book
VALUES(30,'A Moveable Feast',60,'2015',300,6)
INSERT INTO Book
VALUES(40,'The Gypsies',70,'2018',400,7)
INSERT INTO Book
VALUES(50,'The Great Gatsby',80,'2019',200,6)
INSERT INTO Book
VALUES(60,'Shakespeare',90,'2016',300,7)
INSERT INTO Book
VALUES(70,'Animal Farm',50,'2011',200,4)
INSERT INTO Book
VALUES(80,'Hamlet',90,'2019',300,8)

INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(10,1,2,TO_DATE(sysdate, 'dd-mm-yyyy'), '31-12-2021');
INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(80,3,4,TO_DATE(sysdate, 'dd-mm-yyyy'), '31-01-2022');
INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(20,6,2,TO_DATE(sysdate, 'dd-mm-yyyy'), '10-02-2022');

# Updates and Deletes
UPDATE position 
SET position_name = 'Assistant'
WHERE position_id = 500; 

UPDATE employee 
SET employee_name = 'Martin',
phone_number = '0884523135'
WHERE employee_id = 4;

Изтриване на записи
DELETE FROM employee
WHERE employee_id = 5;

DELETE FROM reader
WHERE reader_id = 7;

# Selects and Queries

SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE author_name = 'Hemingway';

SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE book_name LIKE '%Gat%';

SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE genre_name = 'Novel';

SELECT r.reader_name, b.book_name,br.date_borrow,br.date_period, e.employee_name
FROM Borrowing br
JOIN Book b
ON b.book_id = br.book_id
JOIN Reader r
ON r.reader_id = br.reader_id
JOIN Employee e
ON e.employee_id = br.employee_id
WHERE reader_name = 'Stoyan';

SELECT r.reader_name, b.book_name, br.date_borrow, br.date_period, e.employee_name
FROM Borrowing br
JOIN Book b
ON b.book_id = br.book_id
JOIN Reader r
ON r.reader_id = br.reader_id
JOIN Employee e
ON e.employee_id = br.employee_id
WHERE date_period > sysdate
ORDER BY date_period;

# PL/SQL Procedures/Cursors/Triggers

create or replace PROCEDURE BOOK_KEYWORDS(KEYWORDS varchar2) 
IS KEYWORDS_new varchar2(500); 
BEGIN KEYWORDS_new:='%'||KEYWORDS||'%'; 
DECLARE 
CURSOR BK_KEY IS 
SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE b.book_name LIKE KEYWORDS_new;
BEGIN FOR BK_RECORD IN BK_KEY 
LOOP 
DBMS_OUTPUT.PUT_LINE('Book: '||BK_RECORD.book_name||chr(10)||'Author: '||BK_RECORD.author_name||chr(10)||'Year of Release: '||BK_RECORD.year_release||chr(10)|| 'Publisher: '||BK_RECORD.publisher_name||chr(10)||'Genre: '||BK_RECORD.genre_name||chr(10)); 
END LOOP; 
END; 
END;
BEGIN
BOOK_KEYWORDS('&Keywords');
END;

CREATE OR REPLACE PROCEDURE BOOK_SEARCH_AUTHOR
(V_NAME_A AUTHOR.author_name %TYPE) 
IS BEGIN
DECLARE CURSOR BOOK_AUT IS
SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE V_NAME_A = a.author_name; 
BEGIN 
FOR AUT_RECORD 
IN BOOK_AUT 
LOOP 
DBMS_OUTPUT.PUT_LINE('Book: '||AUT_RECORD.book_name||chr(10)||'Author: '||AUT_RECORD.author_name||chr(10)||'Year of Release: '||AUT_RECORD.year_release||chr(10)|| 'Publisher: '||AUT_RECORD.publisher_name||chr(10)||'Genre: '||AUT_RECORD.genre_name||chr(10));
END LOOP;
END; 
END;
BEGIN
BOOK_SEARCH_AUTHOR('&Author');
END;

CREATE OR REPLACE PROCEDURE BOOK_SEARCH_DATE
(V_NAME_B Book.book_name %TYPE)
IS
BEGIN
DECLARE CURSOR Book_EX IS
SELECT br.book_id,br.date_borrow,br.date_period, b.book_name
FROM Borrowing br
JOIN Book b
ON b.book_id = br.book_id
WHERE b.book_name = V_NAME_B;
BEGIN
FOR BOOK_SEARCH_RECORD IN Book_EX
LOOP
DBMS_OUTPUT.PUT_LINE('Book: '||BOOK_SEARCH_RECORD.book_name||chr(10)|| 'Date of Borrow: ' ||BOOK_SEARCH_RECORD.date_borrow||chr(10) || 'Return date: ' || BOOK_SEARCH_RECORD.date_period||chr(10));
END LOOP;
END;
END;
EXEC BOOK_SEARCH_DATE('&Book');

CREATE OR REPLACE PROCEDURE SEARCH_READER
(V_NAME_R Reader.reader_name %TYPE)
IS
BEGIN
DECLARE
CURSOR Reader_ex IS
SELECT r.reader_name,r.reader_phone_number,b.book_name,br.date_period, e.employee_name
FROM Borrowing br
JOIN Book b
ON b.book_id = br.book_id
JOIN Reader r
ON r.reader_id = br.reader_id
JOIN Employee e
ON e.employee_id = br.employee_id
WHERE r.reader_name = V_NAME_R;
BEGIN
FOR READER_RECORD IN Reader_ex
LOOP
DBMS_OUTPUT.PUT_LINE('Reader: '||READER_RECORD.reader_name||chr(10)||'Phone number: '||READER_RECORD.reader_phone_number||chr(10)|| 'Book: '||READER_RECORD.book_name|| chr(10)|| 'Return date: '||READER_RECORD.date_period|| chr(10)|| 'Employee: '||READER_RECORD.employee_name||chr(10));
END LOOP;
END;
END;
BEGIN
SEARCH_READER('&Reader');
END;
