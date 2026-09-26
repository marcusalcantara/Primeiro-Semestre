USE sprint1;

CREATE TABLE professor (
ID INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
nasc DATE
);

INSERT INTO professor VALUES
	('01' , 'Osvaldo' , 'portugues' , '1995-10-10'),
    ('02' , 'Marcos' , 'portugues' , '1986-02-19'),
    ('03' , 'Carlos' , 'algoritmo' , '1986-06-19'),
    ('04' , 'Felipe' , 'banco de dados' , '2000-04-02'),
    ('05' , 'José' , 'inglês' , '1996-07-19'),
    ('06' , 'Marta' , 'história' , '2001-09-20');
    
SELECT * FROM professor;

SELECT especialidade FROM professor;

SELECT * FROM professor 
	WHERE especialidade = 'inglês';
    
SELECT * FROM professor
	ORDER BY nome;
    
SELECT * FROM professor
	ORDER BY nasc DESC;
    
SELECT * FROM professor
	WHERE nome LIKE 'M%';
    
SELECT * FROM professor
	WHERE nome LIKE '%a';
    
SELECT * FROM professor
	WHERE nome LIKE '_a%';
    
SELECT * FROM professor
	WHERE nome LIKE '%t_';
    
DROP TABLE professor;
    
