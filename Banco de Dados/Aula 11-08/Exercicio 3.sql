USE sprint1;
    
CREATE TABLE filme2(
idFilme INT PRIMARY KEY auto_increment,
titulo VARCHAR(50),
genero VARCHAR (40),
diretor VARCHAR (40)
);

INSERT INTO filme2 (titulo, genero, diretor) VALUES

	('O pequenino' , 'Comédia' , 'Ricardinho'),
	('Havaina na esteira' , 'Comédia' , 'Makiki'),
	('Dois caras numa moto' , 'Ação' , 'Labubu'),
	('Leão na casa da vó' , 'Comédia' , 'Ricardinho'),
	('Leopardo' , 'Drama' , 'Marcus'),
	('F1 o filme' , 'Corrida' , 'Manoel'),
	('Os Vingadores' , 'Fantasia' , 'Stan Lee');
    
SELECT * FROM filme2;

ALTER TABLE filme2 ADD COLUMN Protagonista VARCHAR(50);

UPDATE filme2 SET Protagonista = 'Filipinho'
		WHERE IdFilme = 1;

UPDATE filme2 SET Protagonista = 'Alex o leão'
		WHERE IdFilme = 2;

UPDATE filme2 SET Protagonista = 'FMarttt'
		WHERE IdFilme = 3;

UPDATE filme2 SET Protagonista = 'Mcqueen'
		WHERE IdFilme = 4;

UPDATE filme2 SET Protagonista = 'Melmam'
		WHERE IdFilme = 5;

UPDATE filme2 SET Protagonista = 'Glória'
		WHERE IdFilme = 6;

UPDATE filme2 SET Protagonista = 'Martiiin'
		WHERE IdFilme = 7;
        
SELECT * FROM filme2;

ALTER TABLE filme2 MODIFY COLUMN diretor VARCHAR (50);

UPDATE filme2 SET diretor = 'Markin'
	WHERE Idfilme = 5;
    
UPDATE filme2 SET diretor = 'Marcelo'
	WHERE Idfilme = 2 OR idFilme = 7;
    
UPDATE filme2 SET titulo = 'Uma noite no museu'
	WHERE Idfilme = 6;
    
DELETE FROM filme2 WHERE Idfilme = '3';

SELECT * FROM filme2
	WHERE genero <> 'Drama';
    
DESCRIBE filme2;

SELECT * FROM filme2
	WHERE genero = 'Suspense';
    
DESCRIBE filme2;

TRUNCATE TABLE filme2;
