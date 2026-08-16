CREATE DATABASE Week2_BookFlow;
USE Week2_BookFlow;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    published_year INT CHECK (published_year < 2027)
);
INSERT INTO Books (book_id, title, isbn, published_year) VALUES
(1, 'The Alchemist', '9780061122415', 1988),
(2, 'The Hobbit', '9780261102217', 1937),
(3, 'Pride and Prejudice', '9780141439518', 1813);

SELECT * FROM Books;

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO Members (member_id, full_name, email) VALUES
(201, 'Aarav Mehta', 'aarav.mehta@librarymail.com'),
(202, 'Ishita Rao', 'ishita.rao@librarymail.com'),
(203, 'Kabir Nair', 'kabir.nair@librarymail.com');

SELECT * FROM Members;

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Loans (loan_id, member_id, book_id, loan_date) VALUES
(101, 201, 1, '2026-01-05'),
(102, 202, 2, '2026-01-08'),
(103, 203, 3, '2026-01-10'),
(104, 201, 2, '2026-02-01'),
(105, 202, 1, '2026-02-05'),
(106, 203, 2, '2026-02-12'),
(107, 201, 3, '2026-03-01'),
(108, 202, 3, '2026-03-07'),
(109, 203, 1, '2026-03-15'),
(110, 201, 1, '2026-04-01');

SELECT * FROM Loans;

SELECT m.full_name AS Member_Name,
       b.title AS Book_Title
FROM Loans l
INNER JOIN Members m
ON l.member_id = m.member_id
INNER JOIN Books b
ON l.book_id = b.book_id;

SELECT published_year,
       COUNT(book_id) AS Total_Books
FROM Books
GROUP BY published_year
ORDER BY published_year;

CREATE TABLE Donation_History (
    donation_id INT PRIMARY KEY,
    book_id INT,
    donor_name VARCHAR(100),
    donation_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

START TRANSACTION;

INSERT INTO Books
(book_id, title, isbn, published_year)
VALUES
(4, 'Atomic Habits', '9780735211292', 2018);

INSERT INTO Donation_History
(donation_id, book_id, donor_name, donation_date)
VALUES
(1, 4, 'Rohan Kapoor', CURDATE());

COMMIT;

CREATE INDEX idx_books_isbn
ON Books(isbn);

SELECT *
FROM Books
WHERE isbn = '9780735211292';