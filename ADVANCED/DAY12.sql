CREATE DATABASE tv;
USE tv;

CREATE TABLE series (
    title VARCHAR(255),
    network_id INT,
    seasons INT,
    rating DOUBLE,
    runtime INT
);

CREATE TABLE networks (
	id INT,
    name VARCHAR(255),
    country VARCHAR(100),
    website VARCHAR(255)
);

INSERT INTO series (title, seasons, rating, runtime, network_id) VALUES 
	('Game of Thrones', 8, 9.3, 57, 1),
	('The Walking Dead', 10, 8.2, 44, 2),
	('Stranger Things', 3, 8.8, 51, 3),
	('Breaking Bad', 5, 9.5, 49, 2),
	('13 Reasons Why', 3, 7.8, 60, 3),
	('The Witcher', 1, 8.5, 60, 3);
    
INSERT INTO networks (id, name, country, website) VALUES
	(1,	'HBO', 'USA', 'hbogo.com'),
	(2,	'AMC', 'USA', 'amc.com'),
	(3,	'Netflix', 'USA', 'www.netflix.com'),
    (4, 'Fox', 'USA', 'www.fox.com');

-- SUBQUERY

-- IN SELECT CLAUSE (MOSTLY USED IN CASES OF AGGREGATE FUNCTIONS)
SELECT 
    title,
    IF(seasons >= (SELECT 
                AVG(seasons)
            FROM
                series),
        'Long',
        'Short') AS duration
FROM
    series;

-- IN FROM CLAUSE
SELECT 
    MAX(avg_rating) AS max_rating
FROM
    (SELECT 
        name, AVG(rating) AS avg_rating
    FROM
        series
    INNER JOIN networks ON series.network_id = networks.id
    GROUP BY name) AS network_ratings;
-- NOTE : IT IS COMPULSORY FOR A SUBQUERY TO HAVE AN ALIAS (Ex: IN THE ABOVE SUBQUERY HAS AN ALIAS OF network_ratings)

-- IN WHERE CLAUSE (EXISTS AND NOT EXISTS OPERATOR)
SELECT name FROM networks
WHERE EXISTS
	(SELECT * FROM series WHERE network_id = networks.id) GROUP BY name;

-- ANY  AND ALL OPERATOR
SELECT title FROM series WHERE network_id = 2 AND rating > 
	ANY ( SELECT rating FROM series WHERE network_id = 3);
    
SELECT title FROM series WHERE network_id = 2 AND rating > 
	ALL ( SELECT rating FROM series WHERE network_id = 3);

