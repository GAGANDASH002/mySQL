-- AGGREGATE FUNCTIONS

USE website;
ALTER TABLE staff ADD salary DOUBLE;
SELECT * FROM STAFF;

SET SQL_SAFE_UPDATES = 0;

UPDATE staff SET salary=80500.00 WHERE id=1;
UPDATE staff SET salary=42000.00 WHERE id=2;
UPDATE staff SET salary=65000.00 WHERE id=3;
UPDATE staff SET salary=72000.00 WHERE id=4;
UPDATE staff SET salary=94800.00 WHERE id=5;
UPDATE staff SET salary=58000.00 WHERE id=6;
UPDATE staff SET salary=70000.00 WHERE id=7;

SELECT MIN(salary) FROM STAFF;
SELECT MAX(first_name) FROM STAFF;
SELECT SUM(salary) FROM STAFF;
SELECT AVG(salary) FROM STAFF;
SELECT COUNT(last_name) FROM STAFF; -- COUNTS NOT NULL VALUES
SELECT COUNT(*) FROM STAFF;

-- GROUP BY
ALTER TABLE STAFF ADD department VARCHAR(255);
SET SQL_SAFE_UPDATES = 0;

UPDATE staff SET department='Software Development' WHERE id=1;
UPDATE staff SET department='Human Resources' WHERE id=2;
UPDATE staff SET department='Software Development' WHERE id=3;
UPDATE staff SET department='Finance' WHERE id=4;
UPDATE staff SET department='Software Development' WHERE id=5;
UPDATE staff SET department='Software Development' WHERE id=6;
UPDATE staff SET department='Finance' WHERE id=7;

SELECT * FROM STAFF;

SELECT department, COUNT(department) FROM STAFF GROUP BY department;

-- LOGICAL OPERATORS : AND, OR, NOT
SELECT 
    *
FROM
    STAFF
WHERE
    ID >= 4 AND last_name IS NOT NULL
        AND department = 'Software Development';
        
SELECT 
    *
FROM
    STAFF
WHERE
    first_name = 'James' OR salary > 70000;
    
SELECT 
    *
FROM
    STAFF
WHERE
    NOT department = 'Software Development';

-- HAVING CLAUSE: USED WITH GROUP BY AS WHERE CLAUSE DOESN'T WORK WITH GROUP BY
SELECT 
	department,
    AVG(salary)
FROM
    STAFF
GROUP BY department
HAVING AVG(salary) > 50000
ORDER BY department;

-- ROLLUP: providing a way to generate subtotals and grand totals for multiple dimensions within a dataset.
SELECT department, SUM(salary) FROM STAFF GROUP BY department WITH ROLLUP;
