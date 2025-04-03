USE store;
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE vegetables ADD price_category VARCHAR(50);
SELECT * FROM vegetables;

UPDATE vegetables SET price_category = 'expensive' WHERE price > 2;
UPDATE vegetables SET price_category = 'cheap' WHERE price <= 2;

SELECT price_category, COUNT(*) FROM vegetables GROUP BY price_category;
-- DROP TABLE vegetables;