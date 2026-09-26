-- EXERCICIO 2
USE sprint1;
CREATE TABLE musica2(
id INT PRIMARY KEY auto_increment,
titulo VARCHAR (40),
artista VARCHAR (40),
genero VARCHAR (40)
); 

INSERT INTO musica2 (titulo, artista, genero) VALUES
	('Outro gol papai', 'Futparodias', 'Paródia'),
	('Se tudo der errado amanhã', 'Rashid', 'RAP'),
	('Yowa', 'Rashid', 'RAP'),
	('Um sonho só', 'Rashid', 'RAP'),
	('Te esperando', 'Luan Santana', 'RAP'),
	('O show tem que continuar', 'Beth Carvalho', 'Samba'),
	('Mobbando', 'Isaac', 'Trap');
	
    
SELECT * FROM musica2;
/*TRUNCATE TABLE musica2;*/

ALTER TABLE musica2 ADD COLUMN curtidas INT;

UPDATE musica2 set curtidas = "1000"
	WHERE id = 1;

UPDATE musica2 set curtidas = "1000000"
	WHERE id = 2;
    
UPDATE musica2 set curtidas = "5000"
	WHERE id = 3;

UPDATE musica2 set curtidas = "13"
	WHERE id = 4;

UPDATE musica2 set curtidas = "100"
	WHERE id = 5;

UPDATE musica2 set curtidas = "7633"
	WHERE id = 6;

UPDATE musica2 set curtidas = "433"
	WHERE id = 7;

ALTER TABLE musica2 MODIFY COLUMN artista VARCHAR(80);

SELECT * FROM musica2;
DESCRIBE musica2;

UPDATE musica2 SET curtidas = '12343'
	WHERE id = 1;

UPDATE musica2 SET curtidas = '1002233'
	WHERE id = 2 OR id = 3;
	
UPDATE musica2 SET titulo = 'Eu você o mar e ela'
	WHERE id = 5;
    
DELETE FROM musica2 WHERE id = 4;

SELECT genero FROM musica2
	WHERE genero <> 'Funk';
    
SELECT * FROM musica2
	WHERE curtidas >= 20;
    
DESCRIBE musica2;
TRUNCATE TABLE musica2;

