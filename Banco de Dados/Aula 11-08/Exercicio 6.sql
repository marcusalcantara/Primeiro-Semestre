
USE sprint1;

CREATE TABLE revista(
idRevista INT PRIMARY KEY auto_increment,
nome VARCHAR (40),
categoria VARCHAR (30)
);

INSERT INTO revista (nome) VALUES
('Capricho'),
('Lance!'),
('Recreio'),
('Tititi');

SELECT * FROM revista;

UPDATE revista SET categoria = 'Esporte'
	WHERE idRevista = 1;
    
 UPDATE revista SET categoria = 'Esporte'
	WHERE idRevista = 2;
    
 UPDATE revista SET categoria = 'Crianças'
	WHERE idRevista = 3;
    
 UPDATE revista SET categoria = 'Fofoca'
	WHERE idRevista = 4;
    
INSERT INTO revista (nome, categoria) VALUES
('Labubu' , 'Urso'),
('Babadi' , 'Futebol'),
('Forbes' , 'Luxo');

SELECT * FROM revista;

DESCRIBE revista;

ALTER TABLE revista MODIFY COLUMN categoria VARCHAR (40);

DESCRIBE revista;

ALTER TABLE revista ADD COLUMN periodicidade VARCHAR (50);

SELECT * FROM revista;

ALTER TABLE revista DROP COLUMN periodicidade;
