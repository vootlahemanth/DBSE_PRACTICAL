CREATE DATABASE BankManagementPractice;

USE BankManagementPractice;

CREATE TABLE bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);

ALTER TABLE bank_transactions
ADD account_no VARCHAR(20);

ALTER TABLE bank_transactions
MODIFY customer_name VARCHAR(100);

RENAME TABLE bank_transactions
TO customer_transactions;

TRUNCATE TABLE customer_transactions;

CREATE TABLE bank_backup (
    txn_id INT,
    customer_name VARCHAR(100),
    branch_name VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    account_no VARCHAR(20)
);

DROP TABLE bank_backup;

INSERT INTO customer_transactions
(txn_id, customer_name, branch_name, transaction_type, amount, transaction_date, account_no)
VALUES
(201, 'Arjun', 'Hyderabad', 'Deposit', 6500, '2025-02-05', 'AC1001'),
(202, 'Meghana', 'Hyderabad', 'Withdrawal', 2500, '2025-02-06', 'AC1002'),
(203, 'Rohit', 'Vijayawada', 'Deposit', 13500, '2025-02-08', 'AC1003'),
(204, 'Kavya', 'Visakhapatnam', 'Deposit', 8750, '2025-02-10', 'AC1004'),
(205, 'Nikhil', 'Hyderabad', 'Withdrawal', 4200, '2025-02-11', 'AC1005'),
(206, 'Ananya', 'Visakhapatnam', 'Deposit', 16250, '2025-02-12', 'AC1006'),
(207, 'Varun', 'Vijayawada', 'Withdrawal', 1500, '2025-02-13', 'AC1007'),
(208, 'Divya', 'Hyderabad', 'Deposit', 9800, '2025-02-14', 'AC1008'),
(209, 'Karthik', 'Visakhapatnam', 'Withdrawal', 3750, '2025-02-15', 'AC1009'),
(210, 'Sneha', 'Vijayawada', 'Deposit', 11800, '2025-02-16', 'AC1010');

INSERT INTO customer_transactions
VALUES
(211, 'Aditya', 'Visakhapatnam', 'Deposit', 7250, '2025-02-18', 'AC1011');

UPDATE customer_transactions
SET amount = 5500
WHERE txn_id = 205;

DELETE FROM customer_transactions
WHERE txn_id = 211;

SELECT *
FROM customer_transactions;

SELECT *
FROM customer_transactions
WHERE transaction_type = 'Deposit';

SELECT *
FROM customer_transactions
ORDER BY amount DESC;

CREATE USER IF NOT EXISTS 'Auditor1'@'localhost'
IDENTIFIED BY 'Auditor@123';

CREATE USER IF NOT EXISTS 'BranchManager'@'localhost'
IDENTIFIED BY 'Manager@123';

GRANT SELECT
ON BankManagementPractice.customer_transactions
TO 'Auditor1'@'localhost';

GRANT ALL PRIVILEGES
ON BankManagementPractice.customer_transactions
TO 'BranchManager'@'localhost';

REVOKE SELECT
ON BankManagementPractice.customer_transactions
FROM 'Auditor1'@'localhost';


REVOKE ALL PRIVILEGES
ON BankManagementPractice.customer_transactions
FROM 'BranchManager'@'localhost';

START TRANSACTION;

UPDATE customer_transactions
SET amount = 7000
WHERE txn_id = 201;

COMMIT;

START TRANSACTION;

SAVEPOINT Before_Update;

UPDATE customer_transactions
SET amount = 99999
WHERE txn_id = 202;

ROLLBACK TO Before_Update;

COMMIT;

START TRANSACTION;

UPDATE customer_transactions
SET amount = 8500
WHERE txn_id = 201;

SAVEPOINT SP1;

UPDATE customer_transactions
SET amount = 9500
WHERE txn_id = 202;

ROLLBACK TO SP1;

COMMIT;

SELECT *
FROM customer_transactions;
