use sprint1;

-- EXERCICIO 1
CREATE TABLE Atleta1(
idAtleta INT PRIMARY KEY auto_increment,
nome VARCHAR (40),
modalidade VARCHAR (40),
qntMedalha INT);

INSERT INTO Atleta1 (nome, modalidade, qntMedalha) VALUES
	('Messi', 'Futebol', 8),
    ('CR7' , 'Futebol', 5),
    ('Curry', 'Basquete', 10),
    ('Lebrom', 'Basquete', 11),
    ('Wallace', 'Volei', 1);
	
SELECT * FROM atleta1;

TRUNCATE TABLE atleta1;

UPDATE atleta1 SET qntMedalha = '2'
	WHERE idAtleta = 1;
    
UPDATE atleta1 SET qntMedalha = 8
	WHERE idAtleta = 2 OR idAtleta = 3;
    
UPDATE atleta1 SET nome = 'Marcus'
	WHERE idAtleta = 2;
    
ALTER TABLE atleta1 ADD COLUMN dtNasc DATE;

UPDATE atleta1 SET dtNasc = '1982-12-05'
	WHERE idAtleta = 1;

UPDATE atleta1 SET dtNasc = '1952-11-04'
	WHERE idAtleta = 3;

UPDATE atleta1 SET dtNasc = '2006-08-14'
	WHERE idAtleta = 2;
    
UPDATE atleta1 SET dtNasc = '2002-11-04'
	WHERE idAtleta = 4;
    
UPDATE atleta1 SET dtNasc = '2012-05-28'
	WHERE idAtleta = 5;
    
SELECT * FROM atleta1;

DELETE FROM atleta1
	WHERE idAtleta = 1;
    
SELECT nome FROM atleta1
	WHERE modalidade <> 'Natação';
    
SELECT * FROM atleta1
	WHERE qntMedalha >= 3;
    
ALTER TABLE atleta1 MODIFY COLUMN modalidade VARCHAR (60);

DESCRIBE atleta1;
    
TRUNCATE TABLE atleta1;

