CREATE DATABASE blog;

USE blog;

CREATE TABLE posts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) UNIQUE NOT NULL,
    text TEXT NOT NULL,
    author VARCHAR(255) DEFAULT 'admin',
    date DATE NOT NULL,
    status ENUM('draft', 'publish', 'private') DEFAULT 'draft',
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0
);

DESCRIBE posts;
