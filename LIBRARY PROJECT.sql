SELECT * FROM BRANCH;
CREATE TABLE BRANCH(
branch_id VARCHAR(10)PRIMARY KEY,
manager_id VARCHAR(10),
branch_address VARCHAR(55),
contact_no VARCHAR(25)
);

CREATE TABLE ISSUED_STATUS(
issued_id VARCHAR(15) PRIMARY KEY,	
issued_member_id VARCHAR(10),--FK--
issued_book_name VARCHAR(75),
issued_date	DATE,
issued_book_isbn VARCHAR(25),--FK--
issued_emp_id VARCHAR(10) --FK--
)

CREATE TABLE MEMBERS(
member_id VARCHAR(20)PRIMARY KEY,
member_name VARCHAR(25),
member_address VARCHAR(75),
reg_date DATE
)

CREATE TABLE BOOKS(
isbn VARCHAR(20)PRIMARY KEY,	
book_title VARCHAR(150),
category VARCHAR(25),
rental_price FLOAT,
status VARCHAR(15),	
author VARCHAR(25),
publisher VARCHAR(55)
);

CREATE TABLE EMPLOYEE(
emp_id VARCHAR(15) PRIMARY KEY,	
emp_name VARCHAR(25),
position VARCHAR(15),
salary FLOAT,
branch_id VARCHAR(15) --FK--
)

DROP TABLE RETURN_STATUS ;
CREATE TABLE RETURN_STATUS (
return_id VARCHAR(10)PRIMARY KEY,
issued_id VARCHAR(25),
return_book_name VARCHAR(75),
return_date DATE,
return_book_isbn VARCHAR(75)
)
 SELECT * FROM RETURN_STATUS ;

 --FORIGN KEY--
 ALTER TABLE ISSUED_STATUS
 ADD CONSTRAINT FK_MEMBER
 FOREIGN KEY (issued_member_id)
 REFERENCES MEMBERS (member_id);

 --FOREIGN KEY--
 ALTER TABLE EMPLOYEE
 ADD CONSTRAINT FK_BRANCH
 FOREIGN KEY (branch_id)
 REFERENCES BRANCH (branch_id);

 --FOREIGN KEY--
 ALTER TABLE ISSUED_STATUS
 ADD CONSTRAINT FK_BOOKS
 FOREIGN KEY (issued_book_isbn)
 REFERENCES BOOKS(isbn);

 --FOREIGN KEY--
 ALTER TABLE ISSUED_STATUS
 ADD CONSTRAINT FK_EMPLOYEE
 FOREIGN KEY (issued_emp_id)
 REFERENCES EMPLOYEE(emp_id);

 --FOREIGN KEY--
 ALTER TABLE RETURN_STATUS
 ADD CONSTRAINT FK_ISSUED_STATUS
 FOREIGN KEY (issued_id)
 REFERENCES ISSUED_STATUS (issued_id);

 -- INSERT DATA INTO THE TABLE --

 INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;


-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


-- Insert values into each employees table
INSERT INTO employee(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employee;


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');


-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');


-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES


('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');
SELECT * FROM employee;
SELECT * FROM branch;
--PROJECT TASK--
--TASK 1) CREATE A NEW BOOK RECORD --"978-1-60129-456-2",'TO KILL A MOCKINGBIRD','CLASSIC',6.00,'YES','HARPER LEE','J.B. LIPPINCOTT'&CO.')"--
INSERT INTO BOOKS (isbn,book_title,category,rental_price,status,author,publisher)
VALUES 
(978-1-60129-456-2,'TO KILL A MOCKINGBIRD','Classic',6.00,'Yes','HARPER LEE','J.B. LIPPINCOTT&CO.')

--Task 2)update an existing member address--
UPDATE MEMBERS
SET member_address='125 Main St'
WHERE member_id ='C101';

--Task 3)DELETE A RECORD FROM THE ISSUED STATUS TABLE--OBJECTIVE : DELETE THE RECORD WITH ISSUED_ID='IS107' FROM THE ISSUED_STATUS TABLE.--
DELETE FROM ISSUED_STATUS
WHERE issued_id ='IS122';

--Task 4)RETRIVE ALL BOOKS ISSUED BY A SPECIFIC EMPLOYEE --OBJECTIVE:SELECT ALL BOOKS ISSUED BY THE EMPLOYEE WITH EMP_ID='E101'--
SELECT * FROM ISSUED_STATUS
WHERE issued_emp_id ='E101';

--Task 5) LIST MEMBER WHO HAVE ISSUED MORE THAN ONE BOOK--OBJECTIVE: USE GROUP BY TO FIND MEMBERS WHO HAVE ISSUED MORE THAN ONE BOOK.
SELECT ISSUED_EMP_ID ,COUNT(ISSUED_ID) AS "TOTAL BOOK ISSUED" FROM ISSUED_STATUS
GROUP BY ISSUED_EMP_ID
HAVING COUNT(ISSUED_ID)>1;

--Task 6) CTAS(CREATE TAVBLE AS SELECT):USED CTAS TO GENERATE NEW TABLE BASED ON QUERY RESULTS- EACH BOOK AND TOTAL BOOK_ISSUED_CNT --
CREATE TABLE BOOKS_CNT
AS
SELECT B.ISBN,	
		B.BOOK_TITLE,	
		COUNT(I.issued_id) AS NO_ISSUED
FROM BOOKS AS B
JOIN ISSUED_STATUS AS I
ON B.isbn = I.ISSUED_BOOK_ISBN
GROUP BY 1;
SELECT * FROM BOOKS_CNT ;

--Task 7) RETRIVE ALL BOOKS IN SPECIFIC CATEGORY:--
SELECT * FROM BOOKS
WHERE CATEGORY='Classic';

--TASK 8) FIND THE RENTAL INCOME BY CATEGORY:--
SELECT B.CATEGORY,SUM(B.RENTAL_PRICE)AS "RENTAL INCOME" FROM BOOKS AS B 
JOIN ISSUED_STATUS AS I
ON B.isbn = I.ISSUED_BOOK_ISBN
GROUP BY B.CATEGORY ;

--TASK 9)LIST THE MEMBERS WHO RAGISTRED IN THE LAST 180 DAYS :--
SELECT * FROM MEMBERS
WHERE REG_DATE >= current_date - interval '180 days';

INSERT INTO MEMBERS (MEMBER_ID,MEMBER_NAME,MEMBER_ADDRESS,REG_DATE)
VALUES
('C122','sammuel','145 radhai nagari','2024-08-01'),
('C123','ammuel','1235 radhai nagari','2024-09-01')

--Task 10) list the employees with their branch managers name and their branch details:--
select e.emp_id,e.emp_name,e2.emp_name as "Manger name",b.branch_id,b.branch_address from employee as e 
join branch as b
on e.branch_id = b.branch_id
join employee as e2
on b.manager_id = e2.emp_id;

--Task 11) CREATE A TABLE OF BOOKS WITH RENTAL PRICE ABOVE A CERTAIN THRESHOLD 7 USD:(CTAS)--
CREATE TABLE BOOKS7
AS
SELECT * FROM BOOKS 
WHERE RENTAL_PRICE >7;

SELECT * FROM BOOKS7;

--TASK 12)RETRIVE THE LIST OF BOOKS NOT YET RETURNED --
SELECT * FROM ISSUED_STATUS;
SELECT * FROM RETURN_STATUS;

SELECT I.ISSUED_BOOK_NAME AS "NOT RETURNED BOOK NAME LIST" FROM ISSUED_STATUS AS I
LEFT JOIN RETURN_STATUS AS R
ON I.ISSUED_ID = R.ISSUED_ID
WHERE R.RETURN_ID IS NULL;

-- Task 13) Identify members with overdue books write a query to identify members who have overdue  books(suume a 30 day return period)display the member's id, members name, book title.assume date and days overdue --
SELECT * FROM MEMBERS;
select * from books;
select * from issued_status;
select * from return_status;

select i.issued_member_id,m.member_name,b.book_title as Book_title,i.issued_date,
	current_date - i.issued_date as over_dues
from members m
join issued_status i
on m.member_id = i.issued_member_id
join books as b
on i.issued_book_isbn = b.isbn 
left join return_status as r
on r.issued_id = i.issued_id
where r.return_date is null 
and (current_date - i.issued_date)>30
order by 1;

--Task 14)UPDATE BOOK STATUS ON RETURN WRITE A QUERY TO UPDATE THE STATUS OF BOOKS IN THE BOOKS TABLE TO "YES" WHEN THEY ARE RETURNED (BASED ON ENTRIES in the RETURN_STATUS TABLE).--
SELECT * FROM EMPLOYEE ;
select * from BOOKS ;
select * from return_status ;
select * from issued_status ;
--Task 15) BRANCH PERFORMANCE REPORT--
--CREATE QUERY THAT GENERATE A PERFORMANCE REPORT FOR EACH BRANCH,SHOWING THE NUMBER OF BOOKS ISSUED, THE NUMBER OF BOOKS RETURNED, AND THE TOTAL REVENUE GENERATED FROM BOOKS RENTALS--
CREATE TABLE BRANCH_REPORT
AS
SELECT 
    B.BRANCH_ID,
    B.MANAGER_ID,
    COUNT(IST.ISSUED_ID) AS NO_OF_BOOK_ISSUED,
    COUNT(R.RETURN_ID) AS NO_OF_BOOK_RETURNED,
    SUM(BK.RENTAL_PRICE) AS TOTAL_REVENUE
FROM ISSUED_STATUS AS IST
JOIN EMPLOYEE E
    ON E.EMP_ID = IST.ISSUED_EMP_ID
JOIN BRANCH AS B
    ON E.BRANCH_ID = B.BRANCH_ID 
JOIN RETURN_STATUS AS R
    ON R.ISSUED_ID = IST.ISSUED_ID
JOIN BOOKS AS BK
    ON BK.ISBN = IST.ISSUED_BOOK_ISBN
GROUP BY B.BRANCH_ID, B.MANAGER_ID;

SELECT * FROM BRANCH_REPORT ;

--Task 16) CTAS: CREATE A TABLE OF ACTIVE MEMBERS--
-- USE THE CREATE TABLE AS (CTAS) STATEMENT TO CREATE A NEW TABLE ACTIVE_MEMBERS CONTAINING MEMBERS WHO HAVE ISSUED AT LEAST ONE BOOK IN THE LAST 12 MONTHS.--
SELECT * FROM MEMBERS ;
select * from issued_status ;

CREATE TABLE ACTIVE_MEMBERS
AS
SELECT *
from members 
where member_id in(select distinct issued_member_id from issued_status
					where issued_date >= current_date - interval '12 month');

select * from active_members ;

--Task 17: FIND THE EMPLOYEES WITH THE MOST BOOK ISSUED PROCESSED --
--WRITE A QUERY TO FIND THE TOP 3 EMPLOYEES WHO HAVE PROCESSED THE MOST BOOK ISSUES. DISPLAY THE EMPLOYEE NAME,NUMBER OF BOOK PROCESSED,AND THEIR BRANCH.--

SELECT E.EMP_NAME,
	COUNT(I.ISSUED_ID)AS NO_OF_BOOK_ISSUED,
	E.BRANCH_ID
FROM EMPLOYEE AS E
JOIN ISSUED_STATUS AS I
ON E.EMP_ID =I.ISSUED_EMP_ID
GROUP BY EMP_ID
ORDER BY NO_OF_BOOK_ISSUED DESC
LIMIT 3;





