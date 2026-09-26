USE sprint1;

CREATE TABLE atleta (
ID INT PRIMARY KEY,
nome VARCHAR(40),
modalidade VARCHAR(40),
medalhas INT
);

INSERT INTO atleta VALUES
	('15' , 'Marcus' , 'Futebol' , 10),
	('10' , 'Felipe' , 'Futebol' , 2),
	('11' , 'Lucas' , 'Basquete' , 1),
	('12' , 'Gabriel' , 'Basquete' , 4);
    
SELECT * FROM atleta;

SELECT nome, medalhas FROM atleta;

-- DELETE FROM atleta WHERE id = 111222333;

SELECT * FROM atleta
	WHERE modalidade = 'Basquete';
    
SELECT * FROM atleta ORDER BY modalidade;
SELECT * FROM atleta ORDER BY medalhas DESC;

SELECT * FROM atleta 
	WHERE nome like '%s%';

SELECT * FROM atleta
	WHERE nome like 'M%';
    
SELECT * FROM atleta
	WHERE nome like '%o';
    
SELECT * FROM atleta
	WHERE nome like '%r_';

DROP TABLE atleta;