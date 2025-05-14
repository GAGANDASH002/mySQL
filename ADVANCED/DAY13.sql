-- CORRELATED SUBQUERIES

SHOW DATABASES;
USE tv;
SHOW TABLES;

SELECT title, rating FROM series WHERE rating > (SELECT AVG(rating) FROM series);
SELECT network_id, AVG(rating) FROM series GROUP BY network_id;

-- CORRELATED QUERY :
SELECT title, rating, network_id FROM series AS s WHERE rating > (SELECT  AVG(rating) FROM series GROUP BY network_id HAVING s.network_id = network_id);