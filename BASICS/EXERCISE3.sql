USE store;

SHOW TABLES;

SELECT COUNT(*) FROM vegetables WHERE weight >=350;
SELECT AVG(price) FROM vegetables;
SELECT MIN(price), MAX(price) FROM vegetables;
-- DELETE VEGETABLE WITH HIGHEST WEIGHT
DELETE FROM vegetables ORDER BY weight DESC LIMIT 1;

SELECT * FROM vegetables; 
