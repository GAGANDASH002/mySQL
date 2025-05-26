-- CSV TO MYSQL FILE USING MYSQL SERVER
CREATE DATABASE super_db_server;
USE super_db_server;

CREATE TABLE staff(first_name VARCHAR(50), last_name VARCHAR(50), department VARCHAR(50), id INT, location VARCHAR(50));

-- import data from csv file to sql table
LOAD DATA INFILE '/C:/mysql/staff.csv'
INTO TABLE staff
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- export data from sql table to csv file

SELECT 'first_name', 'last_name', 'department','id','location'
UNION ALL
SELECT * FROM staff
INTO OUTFILE "/C:/mysql/exported_data.csv"
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';