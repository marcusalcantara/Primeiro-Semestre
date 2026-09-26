
USE sprint1;

CREATE TABLE professor1(
idProfessor INT PRIMARY KEY auto_increment,
nome VARCHAR (50),
especialidade VARCHAR (40),
dtNasc DATE
);

INSERT INTO professor1 (nome, especialidade, dtNasc) VALUES
('Friza' , 'PI' , '1900-05-05'),
('JP' , 'Algoritimo' , '1980-06-17'),
('Marcio' , 'Sistemas Operacionais' , '1990-10-25'),
('Ana' , 'PI' , '1956-02-20'),
('Anderson' , 'PI' , '2002-11-13'),
('Malu' , 'Tecnologia da Informação' , '1995-01-03');

SELECT * FROM professor1;

ALTER TABLE professor1 ADD COLUMN funcao VARCHAR (50) 
	CHECK (funcao = 'monitor' OR funcao = 'assistente' OR funcao = 'titular' );
    
DESCRIBE professor1;
USE sprint1;

UPDATE professor1 SET `funcao` = 'monitor' 
	WHERE (`idProfessor` = '1');

UPDATE professor1 SET funcao = 'assistente' 
	WHERE (idProfessor = '1' OR idprofessor = '4');
    
UPDATE professor1 SET funcao = 'monitor' 
	WHERE ( idProfessor = '5' OR idProfessor = '3' OR  idProfessor = '2');
 
UPDATE professor1 SET funcao = 'titular' 
	WHERE ( idProfessor = '6');
 
 SELECT * FROM professor1;
 
ALTER TABLE professor1 DROP COLUMN funcao;

INSERT INTO professor1 (nome, especialidade, dtNasc, funcao) VALUES 
	('Juan Craque' , 'Matemática' , '2002-03-07' , 'titular');
    
DELETE FROM professor1 
	WHERE idProfessor = '4';
    
SELECT * FROM professor1
	WHERE funcao = 'titular';
    
SELECT especialidade, dtNasc FROM professor1
	WHERE funcao = 'monitor';
    
TRUNCATE TABLE professor1;
