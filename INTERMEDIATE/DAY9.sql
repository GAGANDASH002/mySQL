-- STRING FUNCTIONS

USE website;
CREATE TABLE customers (
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    country VARCHAR(255),
    password VARCHAR(255)
);

INSERT INTO customers (first_name, last_name, address, country, password)
    VALUES ('Liam', 'Davis', '936 Andover Dr. Brooklyn, NY 112119', 'USA', '12345');
INSERT INTO customers (first_name, last_name, address, country, password)
    VALUES ('Lucas', 'King', '8873 Sage Ave. Cold Lake, AB T9M 0T7', 'Canada', '    qwer');
INSERT INTO customers (first_name, last_name, address, country, password)
    VALUES ('Ethan', 'Miller', '709 Ramblewood St. Hampton, VA 23666', 'USA', '98');

-- CONCAT
SELECT CONCAT(first_name,' ', last_name) AS full_name FROM customers;
-- UPPER
SELECT UPPER(first_name) AS upper_name FROM customers;
-- LOWER 
SELECT LOWER(first_name) AS lower_name FROM customers;

SELECT UPPER(CONCAT(first_name,' ', last_name)) AS upper_full_name FROM customers;

-- LENGTH
SELECT LENGTH(password) AS passlength FROM customers;
-- TRIM ( REMOVES LEADING AND TRAILING WHITESPACES ONLY AND NOT ANY WHITESPACE IN BETWEEN)
SELECT LENGTH(TRIM(password)) AS passlength FROM customers;

-- REPLACE
SELECT REPLACE(country, 'USA', 'United States') AS country FROM customers;
SELECT * FROM customers;
-- SUBSTRING
SELECT SUBSTRING(address, 1, 3) AS house_no FROM customers;
-- POSITION
SELECT POSITION(' ' IN address) AS whitespace FROM customers;

SELECT SUBSTRING(address, 1, POSITION(' ' IN address) - 1) AS house_no FROM customers;

-- SUBSTRING_INDEX
SELECT SUBSTRING_INDEX(address, ' ', 1) AS house_no FROM customers;
SELECT SUBSTRING_INDEX(address, ' ', -1) AS zip_code FROM customers;

SELECT * FROM customers;