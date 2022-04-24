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
 
CREATE TABLE Author --n2
(
author_id INT NOT NULL,
author_name VARCHAR(20),
PRIMARY KEY(author_id)
);
 
CREATE TABLE Reader --n3
(
reader_id INT NOT NULL,
reader_phone_number VARCHAR(20),
reader_name VARCHAR(20),
PRIMARY KEY(reader_id)
);

CREATE TABLE Borrowing --n4
(
book_id INT,
reader_id INT,
employee_id INT,
date_borrow DATE,
date_period DATE
);

CREATE TABLE Genre --n5
(
genre_id INT,
genre_name VARCHAR(20),
PRIMARY KEY(genre_id)
);

CREATE TABLE Employee --n6
(
employee_id INT NOT NULL,
position_id INT,
employee_name VARCHAR(20),
phone_number VARCHAR(20),
PRIMARY KEY(employee_id)
);

CREATE TABLE Position -- n6
(
position_id INT NOT NULL,
position_name VARCHAR(20),
PRIMARY KEY(position_id)
);

CREATE TABLE Publisher --n7
(
publisher_id INT NOT NULL,
publisher_name VARCHAR(20),
PRIMARY KEY(publisher_id)
);
-- book_alter1
ALTER TABLE Book 
ADD CONSTRAINT Book_Genre_FK
FOREIGN KEY (genre_id)
REFERENCES Genre(genre_id);
-- book_alter2
ALTER TABLE Book
ADD CONSTRAINT Book_Publisher_FK
FOREIGN KEY (publisher_id)
REFERENCES Publisher(publisher_id);
-- book_alter3
ALTER TABLE Book
ADD CONSTRAINT Book_Author_FK
FOREIGN KEY (author_id)
REFERENCES Author(author_id);
-- emp_alter
ALTER TABLE Employee
ADD CONSTRAINT Employee_Position_FK
FOREIGN KEY (position_id)
REFERENCES Position(position_id);

-- borrow_alter1
ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Book_FK FOREIGN KEY (book_id) REFERENCES Book(book_id);
--borrow alter2
ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id);
--borrow alter3
ALTER TABLE Borrowing
ADD CONSTRAINT Borrowing_Reader_FK FOREIGN KEY (reader_id) REFERENCES Reader(reader_id);

--добавяне на информация в Reader
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

-- добавяне на информация в position
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

-- добавяне на информация в employee
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

-- добавяне на информация в publisher
INSERT INTO publisher (publisher_id,publisher_name)
VALUES(200,'Ciela'); 
INSERT INTO publisher
VALUES(300,'Helikon');
INSERT INTO publisher
VALUES(400,'Colibri');

-- добавяне на информация в Genre
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

-- добавяне на информация в Author
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

-- добавяне на информация в Book
INSERT INTO Book (book_id,book_name,author_id,year_release,publisher_id,genre_id)
VALUES(10,'1984',50,'2016', 200, 4);
INSERT INTO Book
VALUES(20,'A Farewell to Arms',60,'2014',300,6);
INSERT INTO Book
VALUES(30,'A Moveable Feast',60,'2015',300,6);
INSERT INTO Book
VALUES(40,'The Gypsies',70,'2018',400,7);
INSERT INTO Book
VALUES(50,'The Great Gatsby',80,'2019',200,6);
INSERT INTO Book
VALUES(60,'Shakespeare',90,'2016',300,7);
INSERT INTO Book
VALUES(70,'Animal Farm',50,'2011',200,4);
INSERT INTO Book
VALUES(80,'Hamlet',90,'2019',300,8);

-- смяна на формата(дата)
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

-- добавяне на информация в Borrowing
INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(10,1,2,TO_DATE(sysdate, 'dd-mm-yyyy'), '31-12-2021');
INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(80,3,4,TO_DATE(sysdate, 'dd-mm-yyyy'), '31-01-2022');
INSERT INTO Borrowing (book_id,reader_id,employee_id,date_borrow,date_period)
VALUES(20,6,2,TO_DATE(sysdate, 'dd-mm-yyyy'), '10-02-2022');

-- редакттиране на записи
UPDATE position 
SET position_name = 'Assistant'
WHERE position_id = 500; 

UPDATE employee 
SET employee_name = 'Martin',
phone_number = '0884523135'
WHERE employee_id = 4;

DELETE FROM employee
WHERE employee_id =5;

-- търсене на книги по автор
SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE author_name = 'Fitzgerald';

-- търсене на книги по ключови думи от наименованието
SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE book_name LIKE '%Gat%';

-- търсене на книги по жанр
SELECT b.book_name, a.author_name, b.year_release, p.publisher_name, g.genre_name
FROM Book b
JOIN Author a
ON a.author_id = b.author_id
JOIN Publisher p
ON p.publisher_id = b.publisher_id
JOIN Genre g
ON g.genre_id = b.genre_id
WHERE genre_name = 'Novel';

-- справка за заети книги от читател
SELECT r.reader_name, b.book_name,br.date_borrow,br.date_period, e.employee_name
FROM Borrowing br
JOIN Book b
ON b.book_id = br.book_id
JOIN Reader r
ON r.reader_id = br.reader_id
JOIN Employee e
ON e.employee_id = br.employee_id
WHERE reader_name = 'Stoyan';

-- справка за невърнати книги, подредени по дата
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

-- процедура за книги по ключови думи от наименованието
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

-- процедура за търсене на книги по автор
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

-- процедура за невърнати книги
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

-- процедура за заети книги от читател
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

-- процедура за въвеждане на позиция
CREATE OR REPLACE PROCEDURE POSITION_INS 
(v_pos_name POSITION.position_name%TYPE)
AS
BEGIN 
INSERT INTO POSITION(position_name)
Values (v_pos_name);
END; 

BEGIN
POSITION_INS('Admin'); 
END;

-- процедура за въвеждане на читател
CREATE OR REPLACE PROCEDURE READER_INS 
(v_reader_name Reader.reader_name%TYPE, 
v_reader_phone_number Reader.reader_phone_number%TYPE)
AS
BEGIN 
INSERT INTO Reader(reader_name, reader_phone_number)
Values (v_reader_name,v_reader_phone_number);
END; 

BEGIN
READER_INS('Ivan','0874518965'); 
END;

-- процедура за въвеждане на автор
CREATE OR REPLACE PROCEDURE AUTHOR_INS 
(v_author_name Author.author_name%TYPE)
AS
BEGIN 
INSERT INTO Author(author_name)
Values (v_author_name);
END; 

BEGIN
AUTHOR_INS('Kishimoto'); 
END;

-- процедура за въвеждане на жанр
CREATE OR REPLACE PROCEDURE GENRE_INS 
(g_genre_name Genre.genre_name%TYPE)
AS
BEGIN 
INSERT INTO Genre(genre_name)
Values (g_genre_name);
END; 

BEGIN
GENRE_INS('Adventure'); 
END;

-- процедура за въвеждане на работник
CREATE OR REPLACE PROCEDURE EMPLOYEE_INS 
(v_employee_name Employee.employee_name %TYPE,
v_employee_phone_number Employee.phone_number%TYPE,
v_employee_position_id Employee.position_id %TYPE)
AS
BEGIN 
INSERT INTO Employee(employee_name, phone_number, position_id)
Values (v_employee_name, v_employee_phone_number, v_employee_position_id);
END; 

BEGIN
EMPLOYEE_INS('Nedqlko','0899851637', 1); 
END;

-- процедура за въвеждане на издателство
CREATE OR REPLACE PROCEDURE PUBLISHER_INS 
(v_publisher_name Publisher.publisher_name%TYPE)
AS
BEGIN 
INSERT INTO Publisher(publisher_name)
Values (v_publisher_name);
END; 

BEGIN
PUBLISHER_INS('Bertelsmann'); 
END;

-- процедура за въвеждане на Book
CREATE OR REPLACE PROCEDURE BOOK_INS 
(b_book_name Book.book_name%TYPE, 
b_book_year_release Book.year_release%TYPE,
b_book_author_id Book.author_id%TYPE,
b_book_publisher_id Book.publisher_id%TYPE,
b_book_genre_id Book.genre_id %TYPE)
AS
BEGIN
INSERT INTO Book(book_name, year_release, author_id, publisher_id, genre_id)
Values (b_book_name,b_book_year_release, b_book_author_id, b_book_publisher_id, b_book_genre_id);
END; 

BEGIN
BOOK_INS('Bai Ganio','2010',1,1,1); 
END;

-- процедура за въвеждане на заемане на книга
CREATE OR REPLACE PROCEDURE BORROWING_INS 
(br_bor_book_id BORROWING.book_id%TYPE, 
br_bor_reader_id BORROWING.reader_id%TYPE,
br_bor_employee_id BORROWING.employee_id%TYPE,
br_bor_date_borrow BORROWING.date_borrow%TYPE,
br_bor_date_period BORROWING.date_period %TYPE)
AS
BEGIN
INSERT INTO BORROWING(book_id, reader_id, employee_id, date_borrow, date_period)
Values (br_bor_book_id,br_bor_reader_id, br_bor_employee_id, br_bor_date_borrow, br_bor_date_period);
END; 

BEGIN
BORROWING_INS(1,1,1,SYSDATE,'17-02-2022'); 
END;

-- процедура за промяна на автор
CREATE OR REPLACE PROCEDURE AUTHOR_UPD
(v_author_id Author.author_id %TYPE,
v_author_name Author.author_name%TYPE)
AS
BEGIN 
UPDATE Author
set author_name = v_author_name
where author_id = v_author_id;
END;

BEGIN
AUTHOR_INS(1,'A.Konstantinov'); 
END;

-- процедура за промяна на жанр
CREATE OR REPLACE PROCEDURE GENRE_UPD
(v_genre_id Genre.genre_id %TYPE,
v_genre_name Genre.genre_name%TYPE)
AS
BEGIN 
UPDATE Genre
set genre_name = v_genre_name
where genre_id = v_genre_id;
END;

BEGIN
GENRE_UPD(1,'Comic Book'); 
END;

-- процедура за промяна на издателство
CREATE OR REPLACE PROCEDURE PUBLISHER_UPD
(v_publisher_id Publisher.publisher_id %TYPE,
v_publisher_name Publisher.publisher_name %TYPE)
AS
BEGIN 
UPDATE Publisher
set publisher_name = v_publisher_name
where publisher_id = v_publisher_id;
END;

BEGIN
PUBLISHER_UPD(2,'EGMONT'); 
END;

-- процедура за промяна на читател
CREATE OR REPLACE PROCEDURE READER_UPD
(v_reader_id READER.reader_id %TYPE,
v_reader_name READER.reader_name %TYPE,
v_reader_phone_number READER.reader_phone_number %TYPE)
AS
BEGIN 
UPDATE READER
set reader_name = v_reader_name,
reader_phone_number = v_reader_phone_number
where reader_id = v_reader_id;
END;

BEGIN
READER_UPD(2,'Ivailo','0874510607'); 
END;

-- процедура за промяна на позиция
CREATE OR REPLACE PROCEDURE POSITION_UPD
(v_pos_id POSITION.position_id %TYPE,
v_pos_name POSITION.position_name %TYPE)
AS
BEGIN 
UPDATE POSITION
set position_name = v_pos_name
where position_id = v_pos_id;
END;

BEGIN
POSITION_UPD(2,'Specialist'); 
END;

-- процедура за промяна на работник
CREATE OR REPLACE PROCEDURE EMPLOYEE_UPD
(v_employee_id EMPLOYEE.employee_id %TYPE,
v_pos_id EMPLOYEE.position_id %TYPE,
v_empl_name EMPLOYEE.employee_name %TYPE,
v_empl_phone_number EMPLOYEE.phone_number %TYPE)
AS
BEGIN 
UPDATE EMPLOYEE
set employee_name = v_empl_name,
phone_number = v_empl_phone_number
where employee_id = v_employee_id;
END;

BEGIN
EMPLOYEE_UPD(2,2,'Filip','0899851657'); 
END;

-- процедура за промяна на книга
CREATE OR REPLACE PROCEDURE BOOK_UPD
(b_book_id Book.book_id %TYPE,
b_book_name Book.book_name%TYPE,
b_book_year_release Book.year_release%TYPE,
b_book_author_id Book.author_id%TYPE,
b_book_publisher_id Book.publisher_id%TYPE,
b_book_genre_id Book.genre_id %TYPE)
AS
BEGIN
UPDATE Book
set book_name = b_book_name,
year_release = b_book_year_release,
author_id = b_book_author_id,
publisher_id = b_book_publisher_id,
genre_id = b_book_genre_id
where book_id = b_book_id;
END; 

BEGIN
BOOK_UPD(3,'Patepisi','2011',1,1,1); 
END;

-- процедура за промяна на книга
CREATE OR REPLACE PROCEDURE BORROWING_UPD
(br_book_id BORROWING.book_id %TYPE,
br_reader_id BORROWING.reader_id %TYPE,
br_employee_id BORROWING.employee_id%TYPE,
br_date_borrow BORROWING.date_borrow%TYPE,
br_date_period BORROWING.date_period%TYPE)
AS
BEGIN
UPDATE BORROWING
set reader_id = br_reader_id,
employee_id = br_employee_id,
date_borrow = br_date_borrow,
date_period = br_date_period
where book_id = br_book_id;
END; 

BEGIN
BORROWING_UPD(1,1,1,SYSDATE,'20-02-2022'); 
END;

-- процедура за изтриване на автор
CREATE OR REPLACE PROCEDURE AUTHOR_DEL
(v_author_id Author.author_id%TYPE)
AS
BEGIN 
DELETE FROM Author where author_id = v_author_id;
END; 

BEGIN
AUTHOR_DEL(6); 
END;

-- процедура за изтриване на читател
CREATE OR REPLACE PROCEDURE READER_DEL
(v_reader_id READER.reader_id%TYPE)
AS
BEGIN 
DELETE FROM READER where reader_id = v_reader_id;
END; 

BEGIN
READER_DEL(9); 
END;

-- процедура за изтриване на жанр
CREATE OR REPLACE PROCEDURE GENRE_DEL
(v_genre_id GENRE.genre_id%TYPE)
AS
BEGIN 
DELETE FROM GENRE where genre_id = v_genre_id;
END; 

BEGIN
GENRE_DEL(5); 
END;

-- процедура за изтриване на издателство
CREATE OR REPLACE PROCEDURE PUBLISHER_DEL
(v_publisher_id PUBLISHER.publisher_id%TYPE)
AS
BEGIN 
DELETE FROM PUBLISHER where publisher_id = v_publisher_id;
END; 

BEGIN
PUBLISHER_DEL(6); 
END;

-- процедура за изтриване на позиция
CREATE OR REPLACE PROCEDURE POSITION_DEL
(v_pos_id POSITION.position_id%TYPE)
AS
BEGIN 
DELETE FROM POSITION where position_id = v_pos_id;
END; 

BEGIN
POSITION_DEL(6); 
END;

-- процедура за изтриване на книга
CREATE OR REPLACE PROCEDURE BOOK_DEL
(v_book_id BOOK.book_id%TYPE)
AS
BEGIN 
DELETE FROM BOOK where book_id = v_book_id;
END; 

BEGIN
BOOK_DEL(10); 
END;

-- процедура за изтриване на заемане
CREATE OR REPLACE PROCEDURE BORROWING_DEL
(br_book_id BORROWING.book_id%TYPE)
AS
BEGIN 
DELETE FROM BORROWING where book_id = br_book_id;
END; 

BEGIN
BORROWING_DEL(1); 
END;

-- процедура за изтриване на работник
CREATE OR REPLACE PROCEDURE EMPLOYEE_DEL
(e_empl_id EMPLOYEE.employee_id%TYPE)
AS
BEGIN 
DELETE FROM EMPLOYEE where employee_id = e_empl_id;
END; 

BEGIN
EMPLOYEE_DEL(10); 
END;

set serveroutput on;

SELECT
  value
FROM
  V$NLS_PARAMETERS
WHERE
  parameter = 'NLS_DATE_FORMAT';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';