CREATE DATABASE website;
SHOW DATABASES;

USE website;
CREATE TABLE staff(id INT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50));

SHOW TABLES;

INSERT INTO staff values(1, 'James', 'Davis', 'jdavis@gmail.com');
INSERT INTO staff values(2, 'Mary', 'Jane', 'mj@gmail.com');
INSERT INTO staff values(3, 'Michael', 'Smith', 'msmith@gmail.com');