USE website;
-- ORDER BY
SELECT * FROM STAFF ORDER BY last_name;
SELECT * FROM STAFF ORDER BY ID DESC;
-- SORTS BY FIRST_NAME , IF FIRST_NAME IS SAME THEN LAST_NAME IS CHECKED
SELECT * FROM STAFF ORDER BY first_name, last_name;

INSERT INTO STAFF VALUES('8','Ashley','Young','ashleyyoung@gmail.com');

-- UPDATE
SET SQL_SAFE_UPDATES = 0;
UPDATE STAFF SET email = '4.michael@gmail.com' WHERE id = 4;
SELECT * FROM STAFF;

-- DELETE
DELETE FROM STAFF WHERE ID = 4;
