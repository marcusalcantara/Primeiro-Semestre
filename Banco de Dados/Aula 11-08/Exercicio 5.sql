
USE sprint1;

CREATE TABLE curso(
id INT PRIMARY KEY auto_increment,
nome VARCHAR (50),
sigla VARCHAR (3),
coordenador VARCHAR (40)
);

INSERT INTO curso (nome, sigla, coordenador) VALUES
('Medicina' , 'MED' , 'Felipe'),
('Análise e Desenvolvimento de Sistemas' , 'ADS' , 'Felipe'),
('Educação Física' , 'ED' , 'Labubu');

SELECT * FROM curso;

SELECT coordenador FROM curso;

SELECT * FROM curso
	WHERE sigla = 'ADS';
    
SELECT * FROM curso ORDER BY nome ASC;

SELECT * FROM curso ORDER BY nome DESC;

SELECT * FROM curso 
	WHERE nome LIKE 'M%';

SELECT * FROM curso 
	WHERE nome LIKE '%a';
    
SELECT * FROM curso 
	WHERE nome LIKE '_a%';
    
SELECT * FROM curso 
	WHERE nome LIKE '%a_';
    
DROP TABLE curso;
