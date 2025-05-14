CREATE DATABASE cinema;
USE cinema;

CREATE TABLE directors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    country VARCHAR(255)
);
INSERT INTO directors (name, country) VALUES 
	('Martin Scorsese', 'U.S.'),
    ('Alfred Hitchcock', 'England'),
    ('Steven Spielberg', 'U.S.'),
    ('Quentin Tarantino', 'U.S.'),
    ('Christopher Nolan', 'England');

CREATE TABLE films (
    title VARCHAR(255),
    year INT,
    director_id INT,
    genre_id INT
);
INSERT INTO films (title, year, director_id, genre_id) VALUES 
	('The Departed', 2006, 1, 1),
    ('Bumblebee', 2018, 3, 3),
    ('Pulp Fiction', 1994, 4, 1),
    ('Interstellar', 2014, 5, 2),
    ('Dunkirk', 2017, 5, 2);

CREATE TABLE genres (
	id INT PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(255)
);
INSERT INTO genres (genre) VALUES 
	('Crime'), 
    ('Drama'), 
    ('Action'), 
    ('Horror'), 
	('Comedy');

-- find out all directors who have made atleast one film in the crime genre

SELECT * FROM directors WHERE id IN
	(SELECT director_id FROM films WHERE genre_id = 
		(SELECT id FROM genres WHERE genre = 'crime'));