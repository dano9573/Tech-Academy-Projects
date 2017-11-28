CREATE DATABASE Library_Management_System

USE Library_Management_System
GO

/* -----------------------------------------------------------
	CREATE TABLES
	---------------------------------------------------------*/

CREATE TABLE tbl_library_branch (
    branch_branchid INT NOT NULL PRIMARY KEY IDENTITY(1000,1),
	branch_branchname VARCHAR (50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
); 

CREATE TABLE tbl_borrower (
    borrower_cardno INT NOT NULL PRIMARY KEY IDENTITY(10000,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone INT NOT NULL
); 

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone INT NOT NULL,
); 

CREATE TABLE tbl_book_authors (
	authors_bookid INT NOT NULL,
	author_name VARCHAR(50) NOT NULL
	FOREIGN KEY(authors_bookid) REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
); 

CREATE TABLE tbl_book (
    book_bookid INT PRIMARY KEY NOT NULL IDENTITY (100,1),
    book_title VARCHAR(100) NOT NULL,
    book_publisherName VARCHAR(100) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,

);

CREATE TABLE tbl_book_copies (
    copies_bookid INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_branchid INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_no_of_copies INT NOT NULL
); 

CREATE TABLE tbl_book_loans (
    book_loans_bookid INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_branchid INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_branchid) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_cardno INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_dateout DATE NOT NULL,
	book_loans_duedate DATE NOT NULL
);







