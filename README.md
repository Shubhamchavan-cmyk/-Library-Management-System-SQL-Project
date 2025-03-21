📚 Library Management System – SQL Project
📝 Project Overview
This project is a Library Management System implemented using SQL. It includes database schema design, data manipulation, and business queries to solve common library-related questions. The system efficiently manages books, members, employees, and book transactions (issuance and returns).

🗂️ Database Schema
The project contains the following tables:

BRANCH – Stores branch details, including branch ID, manager, address, and contact.
BOOKS – Contains book details such as ISBN, title, category, price, author, and publisher.
MEMBERS – Holds member information including member ID, name, address, and registration date.
EMPLOYEE – Maintains employee details like ID, name, position, salary, and assigned branch.
ISSUED_STATUS – Tracks issued books with details like member ID, book ISBN, issue date, and employee responsible.
RETURN_STATUS – Logs returned books with relevant details.
🔍 Business Questions Solved
This project includes SQL queries that answer key business questions, such as:
✅ Number of books issued per member.
✅ Total revenue generated from book rentals.
✅ Most frequently borrowed books.
✅ Employees responsible for the most book transactions.
✅ Active members based on book borrowing patterns.

📂 Project Files
LIBRARY PROJECT.sql – Contains the database schema and business queries.
README.md – Project documentation.
Sample Data (if available) – Example records for testing.
🚀 How to Use
Run the SQL file in a database management system like MySQL or PostgreSQL.
Execute the business queries to gain insights into the library system.
Modify or expand the database based on additional requirements.
