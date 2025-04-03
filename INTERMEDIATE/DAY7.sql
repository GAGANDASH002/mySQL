USE website;
SHOW TABLES;

-- RIGHT JOIN
SELECT 
    users.first_name, comments.comment_id
FROM
    users
        RIGHT JOIN
    comments ON users.user_id = comments.user_id;

-- CROSS JOIN
CREATE DATABASE cafe;
USE cafe;

CREATE TABLE coffee (coffee_id INT PRIMARY KEY, name VARCHAR(255), size VARCHAR(20), price DOUBLE);

INSERT INTO coffee (coffee_id, name, size, price) VALUES (1, 'Caffe Latte', 'Large', 3.65);
INSERT INTO coffee (coffee_id, name, size, price) VALUES (2, 'Caffe Mocha', 'Large', 4.15);
INSERT INTO coffee (coffee_id, name, size, price) VALUES (3, 'Frappuccino', 'Medium', 3.95);

CREATE TABLE syrups (syrup_id INT PRIMARY KEY, name VARCHAR(255), price DOUBLE);


INSERT INTO syrups (syrup_id, name, price) VALUES (1, 'Caramel', 0.5);
INSERT INTO syrups (syrup_id, name, price) VALUES (2, 'Vanilla', 0.35);
INSERT INTO syrups (syrup_id, name, price) VALUES (3, 'Hazelnut', 0.79);

SELECT coffee.name, coffee.size, syrups.name FROM coffee CROSS JOIN syrups;


    