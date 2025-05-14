CREATE DATABASE online_store;
USE online_store;

CREATE TABLE shops (
	shop_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    website VARCHAR(255)
);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(255),
    product VARCHAR(255),
    price DOUBLE,
    date DATE,
    shop_id INT,
    FOREIGN KEY (shop_id) REFERENCES shops (shop_id)
);


INSERT INTO shops (name, website) VALUES ('Walmart', 'walmart.com');
INSERT INTO shops (name, website) VALUES ('Amazon', 'amazon.com');

INSERT INTO orders (category, product, price, date, shop_id) VALUES
	('TV', 'LG C9', 1500, '2035-10-24', 1),
	('Laptop', 'MacBook Air', 1100, '2035-10-24', 2),
	('Smartphone', 'iPhone 11 PRO', 1000, '2035-10-28', 1),
	('TV', 'Sony A9G', 2500, '2035-10-24', 2);
    
-- VIEWS(ALSO CALLED VIRTUAL TABLES) CHANGES ARE NOT MADE TO A DATABASE WHEN A VIEW IS CREATED
CREATE OR REPLACE VIEW revenue AS
	(SELECT shops.name, SUM(price) AS total_price
    FROM orders
    INNER JOIN shops
    ON orders.shop_id = shops.shop_id
    GROUP BY orders.shop_id
    ORDER BY shops.name);

SELECT * FROM revenue;

DROP VIEW revenue;

-- STORED PROCEDURES

DELIMITER $$
CREATE PROCEDURE report(p_date DATE)
BEGIN
	SELECT category, product, price
		FROM orders
        WHERE date = p_date
        ORDER BY price;
END $$
DELIMITER ;

CALL report('2035-10-24');