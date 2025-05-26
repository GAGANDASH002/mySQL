-- TRIGGERS - THEY ARE A BLOCK OF CODE THAT ARE EXECUTED AFTER AN EVENT OCCURS(DELETE, UPDATE, INSERT)
USE online_store;
DESC orders;
ALTER TABLE shops ADD COLUMN total DOUBLE;
UPDATE shops SET total = (SELECT SUM(price) FROM orders WHERE shop_id = 2) WHERE shop_id = 2;

SELECT * FROM shops;

SELECT * FROM orders;
DELIMITER //
CREATE TRIGGER orders_after_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE shops
		SET total = total + NEW.price
        WHERE shop_id = NEW.shop_id;
END //
DELIMITER ;

INSERT INTO orders VALUES(5, 'Smartphone', 'Apple 16 PRO', 1000, '2035-10-24',  2, 4);

DELIMITER //
CREATE TRIGGER orders_after_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
	UPDATE shops
		SET total = total - OLD.price
        WHERE shop_id = OLD.shop_id;
END //
DELIMITER ;

DELETE FROM orders WHERE id = 5;

-- INDEXES
