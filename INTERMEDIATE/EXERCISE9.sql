USE blog;

CREATE TABLE quotes(name VARCHAR(255), surname VARCHAR(255), quotes VARCHAR(255));

INSERT INTO quotes VALUES ('Walt', 'Disney', 'The way to get started is to quit talking and begin doing.'),('Dalai', 'Lama', 'The purpose of our lives is to be happy.'),('Bob', 'Marley', 'Love the life you live. Live the life you love.'),('Thomas', 'Jefferson', 'I find that the harder I work, the more luck I seem to have.'),('Theodore', 'Roosevelt', 'Believe you can and you are halfway there.');

SELECT UPPER(CONCAT(name,' ', surname)) AS full_name FROM quotes;

SELECT REPLACE(quotes, ' ', '_') AS trimmed FROM quotes;
SELECT LENGTH(REPLACE(quotes,' ','')) AS characters FROM quotes;
SELECT CONCAT(SUBSTRING_INDEX(quotes, ' ', 4),'...') AS concatenated FROM quotes;

