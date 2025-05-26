
DELIMITER $$
CREATE FUNCTION num_products(p_category VARCHAR(50), p_date DATE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE total_num DOUBLE;
    SELECT COUNT(product)
    INTO total_num
    FROM orders
    WHERE category = p_category AND date = p_date;
	RETURN total_num;
END $$
DELIMITER ;

DROP FUNCTION num_products;
SELECT num_products('TV', '2035-10-24') AS total_num;