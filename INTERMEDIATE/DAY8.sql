SHOW DATABASES;
USE cafe;

-- ALIASES
SELECT coffee.name AS coffee, coffee.size, syrups.name AS syrups FROM coffee CROSS JOIN syrups;
SELECT c.name AS coffee, c.size, s.name AS syrups FROM coffee AS c CROSS JOIN syrups AS s;

-- UNION (BOTH SELECT STATEMENTS SHOULD HAVE SAME NUMBER OF COLUMNS AND SAME DATATYPE)
SELECT name,price FROM COFFEE UNION SELECT name,price FROM SYRUPS;
SELECT 'coffee' AS type, name,price FROM COFFEE UNION SELECT 'syrups' AS type,name,price FROM SYRUPS;

-- UNION COMMAND ADDS ONLY UNIQUE VALUES
-- HERE WE USE UNION ALL
INSERT INTO syrups VALUES (4, 'Irish Cream', 0.5);
SELECT price FROM coffee UNION SELECT price FROM SYRUPS;
SELECT price FROM coffee UNION ALL  SELECT price FROM SYRUPS;

-- FIND SUM OF ALL PRICES OF COFFE AND SYRUPS
SELECT SUM(price) FROM (SELECT price FROM coffee UNION ALL  SELECT price FROM SYRUPS) AS prices; 

-- CONSTRAINTS
-- NOT NULL

USE STORE;

CREATE TABLE books(
	name VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    format VARCHAR(50),
    pages INT,
    id INT NOT NULL
);

INSERT INTO books VALUES('The Outsider', 'Stephen King', 'Hardcover', 577, 1);
SELECT * FROM books;
SET SQL_SAFE_UPDATES = 0;
UPDATE books SET id = 10 WHERE format = 'Hardcover';