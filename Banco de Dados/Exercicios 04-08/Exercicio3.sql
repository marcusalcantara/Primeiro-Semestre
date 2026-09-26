USE sprint1;

CREATE TABLE filme(
idFilme INT PRIMARY KEY,
titulo VARCHAR (40),
genero VARCHAR (40),
diretor VARCHAR (40)
);

INSERT INTO filme VALUES
	(11 , 'Anaconda' , 'Ação' , 'Felipe'),
	(1 , 'Tiroteio' , 'Ação' , 'Carlos'),
	(14 , 'O mal' , 'Terror' , 'Felipe'),
	(12 , 'Pecadores' , 'Terror' , 'Rhenan'),
	(16 , 'O amor' , 'Romance' , 'Marcus'),
	(10 , 'Suits' , 'Drama' , 'Felipe'),
	(4 , 'Os suspeitos' , 'Suspense' , 'Lucas');
    
SELECT * FROM filme;

SELECT titulo, diretor FROM filme;

SELECT * FROM filme
Where genero = 'Drama';

SELECT * FROM filme
Where diretor = 'Felipe';

SELECT * FROM filme ORDER BY titulo;

SELECT * FROM filme ORDER BY diretor DESC;

SELECT * FROM filme
	 WHERE titulo like 'O%';
     
SELECT * FROM filme
	 WHERE diretor like '%S';

SELECT * FROM filme
	 WHERE genero like 's%_';
     
SELECT * FROM filme
	 WHERE genero like '_s%';

SELECT * FROM filme
	 WHERE titulo like '%s_';	
     
DROP TABLE musica;