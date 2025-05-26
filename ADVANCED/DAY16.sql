-- USER DEFINED FUNCTIONS
USE online_store;
ALTER TABLE orders ADD COLUMN quantity INT;

UPDATE orders SET quantity = 2 WHERE id = 1;
UPDATE orders SET quantity = 4 WHERE id = 2;
UPDATE orders SET quantity = 3 WHERE id = 3;
UPDATE orders SET quantity = 5 WHERE id = 4;

SELECT * FROM orders;
DELIMITER $$
CREATE FUNCTION total_price()
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE total DOUBLE;
    SELECT SUM(price * quantity)
    INTO total
    FROM orders;
	RETURN total;
END $$
DELIMITER ;

SELECT total_price() AS total;


DELIMITER $$
CREATE FUNCTION total_price_for_id(p_shop_id INT) -- FUNCTIONS TAKE ONLY INPUT PARAMETERS UNLIKE PROCEDURES
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE total DOUBLE;
    SELECT SUM(price * quantity)
    INTO total
    FROM orders
    WHERE shop_id = p_shop_id;
	RETURN total;
END $$
DELIMITER ;

SELECT total_price_for_id(1) AS total;
DROP FUNCTION total_price_for_id;