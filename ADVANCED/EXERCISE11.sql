DELIMITER //
CREATE PROCEDURE classify(p_category VARCHAR(50))
BEGIN
	SELECT * FROM orders
    WHERE category = p_category
    ORDER BY price DESC;
END //
DELIMITER ;

CALL classify('TV');