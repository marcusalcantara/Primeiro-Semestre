USE sprint1;

CREATE TABLE musica (
idMusica INT PRIMARY KEY,
titulo VARCHAR (40),
artista VARCHAR (40), 
genero VARCHAR (40)
);

INSERT INTO musica VALUES
	('11' , 'Se tudo der errado amanhã' , 'Rashid' , 'Rap'),
	('12' , 'Diario de bordo' , 'Rashid' , 'Rap'),
	('13' , 'Melhor eu ir' , 'Pericles' , 'Pagode'),
	('14' , 'O show tem que continuar' , 'Beth Carvalho' , 'Samba'),
	('15' , 'Imbativel' , 'Lele JP' , 'Funk'),
	('16' , 'Hope' , 'XXXTentation' , 'Trap'),
	('17' , 'Lucid Dream' , 'Juice Wrld' , 'Trap');
    
SELECT * FROM musica;

SELECT titulo, artista FROM musica;

SELECT * FROM musica
	Where genero = 'RAP';
    
SELECT * FROM musica
	Where artista = 'Beth Carvalho';
    
SELECT * FROM musica ORDER BY titulo;

SELECT * FROM musica ORDER BY artista DESC;

SELECT * FROM musica
	WHERE titulo like 'S%';
    
SELECT * FROM musica
	WHERE artista like '%d';
    
SELECT * FROM musica
	WHERE genero like '_a%';

SELECT * FROM musica
	WHERE titulo like '%a_';
    
DROP TABLE musica;

	
	