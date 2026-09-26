use sprint1;

CREATE TABLE jogo(
idJogo INT PRIMARY KEY,
nome VARCHAR(50),
comentario VARCHAR (200),
ranking INT
);

INSERT INTO jogo VALUES
	('1' , 'Fifa', 'Muitos bugs' , '5'),
	('2' , 'PES', 'Estragaram o jogo' , '4'),
	('3' , 'Counter Strike', 'Classico' , '3'),
	('4' , 'Read Dead', 'Perdeu a premiação' , '2'),
	('5' , 'Mafia', 'O melhor' , '1');
    
SELECT * FROM jogo;

SELECT nome FROM jogo;

SELECT * FROM jogo
	WHERE comentario = 'O melhor';
    
SELECT * FROM jogo ORDER BY nome;

SELECT * FROM jogo ORDER BY nome DESC;

SELECT * FROM jogo
	WHERE nome LIKE 'M%';
    
SELECT * FROM jogo
	WHERE nome LIKE '%a';

SELECT * FROM jogo
	WHERE nome LIKE '_i%';
    
SELECT * FROM jogo
	WHERE nome LIKE '%i_';
    
SELECT * FROM jogo
	WHERE nome <> 'Minecraft' ;
    
DROP TABLE jogo;



    
