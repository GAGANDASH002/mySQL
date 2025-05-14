USE website;
-- DAYNAME
SELECT first_name,DAYNAME(reg_date) AS day FROM customers;
-- MONTHNAME
SELECT first_name,MONTHNAME(reg_date) AS month FROM customers;
-- DATE_FORMAT (U CAN FIND ALL THE SPECIFIERS LIKE %d FROM MYSQL WEBSITE)
SELECT first_name, DATE_FORMAT(reg_date,'%d/%m/%y') AS date FROM customers;

CREATE DATABASE company;
USE company;

CREATE TABLE staff
(
    name VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(255),
    address VARCHAR(255),
    days_off INT
);

INSERT INTO staff
    (name, phone, email, address, days_off)
VALUES
    ('Andrew', '+1-202-555-0163', 'andrew@gmail.com', '63 Chestnut St. Altoona, PA 16601', 24),
    ('Tom', null, 'tom@gmail.com', '5, Quai des Belges 5929 MARSEILLE', 0),
    ('Ashley', '+1-613-555-0199', 'ashley@gmail.com', '40 10th Ave. Chilcotin, BC V0L 0V5', 15),
    ('Mark', null, null, '4 Church Drive Miami, FL', 0),
    ('Saanvi', null, null, null, 20);

SELECT * FROM staff;
SELECT phone FROM staff;

-- IFNULL
SELECT name,IFNULL(phone, 'unspecified') AS phone FROM staff;

-- IF
SELECT name, IF(days_off > 0, 'YES', 'NO') AS has_days_off, days_off FROM staff;

SET SQL_SAFE_UPDATES = 0;

USE company;

ALTER TABLE staff ADD COLUMN ISO_code VARCHAR(2);
UPDATE staff SET ISO_code = 'US' WHERE name = 'Andrew';
UPDATE staff SET ISO_code = 'FR' WHERE name = 'Tom';
UPDATE staff SET ISO_code = 'CA' WHERE name = 'Ashley';
UPDATE staff SET ISO_code = 'US' WHERE name = 'Mark';
UPDATE staff SET ISO_code = 'IN' WHERE name = 'Saanvi';

SELECT * FROM staff;

SELECT name, ISO_code,
	CASE ISO_code
		WHEN 'US' THEN 'USA'
        WHEN 'CA' THEN 'CANADA'
        WHEN 'IN' THEN 'INDIA'
	ELSE ISO_code
END as country
FROM staff;

-- COALESCE(VAL1, VAL2, VAL3, ....)- CHECKS IF VAL1 IS NULL THEN VAL2 IS DISPLAYED, IF VAL2 IS NULL THEN VAL3 IS DISPLAYED AND SO ON..
SELECT name, COALESCE(phone, email, address, 'unspecified') AS contacts FROM staff;