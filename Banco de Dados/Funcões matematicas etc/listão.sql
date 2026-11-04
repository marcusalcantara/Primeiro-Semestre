CREATE DATABASE pratica_10;
USE pratica_10;

-- EXERCICIO 1
CREATE TABLE genero(
idGenero INT primary KEY auto_increment,
nome VARCHAR(45)
);

INSERT INTO genero values
(default, 'Ação'),
(default, 'Romance'),
(default, 'Aventura');

CREATE TABLE livro(
idLivro INT primary key auto_increment,
titulo VARCHAR(45),
anoLancamento YEAR,
pagina INT,
fkGenero INT,
constraint fkLivroGenero foreign key(fkGenero) REFERENCES genero(idGenero)
) auto_increment = 100;

INSERT INTO livro VALUES
(default, 'Mario Bross', '2024', 100, 1),
(default, 'Luigi', '2026', 55, 1),
(default, 'Carros', '1999', 29, 1),
(default, 'La la land', '2023', 43, 2),
(default, 'O amor', '2019', 58, 2),
(default, 'Paixão', '2013', 19, 2),
(default, 'Up', '2013', 98, 3),
(default, 'Turbo', '2022', 190, 3);

CREATE TABLE leitor(
idLeitor INT primary key auto_increment,
nome VARCHAR(45),
email VARCHAR(45),
cidade VARCHAR(45)
)auto_increment = 1000;

INSERT INTO leitor VALUES
(default, 'Marcus', 'marcusvsa@@@', 'São Paulo'),
(default, 'Renan', 'reanan@@@', 'São Paulo'),
(default, 'Rafael', 'rafa@@@', 'São Paulo'),
(default, 'Kauã', 'kaua@@@', 'São Paulo'),
(default, 'Bruno', 'bruno@@@', 'São Paulo'),
(default, 'Pedro', 'pedro@@@', 'São Paulo');

CREATE TABLE clube(
idClube INT primary key auto_increment,
nome VARCHAR(45),
criacao date
);

INSERT INTO clube VALUES
(default, 'CLube do livro', '2019-12-09'),
(default, 'Livraria Boa', '2022-08-22'),
(default, 'Livros Novos', '2025-02-12');
-- DROP TABLE clube;

CREATE TABLE participacao(
idParticipacao INT auto_increment,
dataIngresso DATE,
qtdEncontro INT,
fkLeitor int,
constraint fkLeitorParticipacao foreign key(fkLeitor) 
	references leitor(idLeitor),
fkClube INT,
constraint fkClubeParticipacao foreign key(fkClube) 
	references clube(idClube),
constraint pkComposta primary key(idParticipacao, fkClube, fkLeitor)
);

INSERT INTO participacao VALUES
(default, '2026-12-10', 5, 1000, 1),
(default, '2026-12-10', 5, 1001, 1),
(default, '2026-12-10', 5, 1002, 2),
(default, '2026-12-10', 5, 1003, 2),
(default, '2026-12-10', 5, 1004, 3),
(default, '2026-12-10', 5, 1005, 3);

SELECT leitor.nome, clube.nome, dataIngresso FROM participacao
JOIN clube ON idClube = fkClube
JOIN leitor ON idLeitor = fkLeitor;

SELECT livro.titulo, genero.nome FROM genero
JOIN livro on fkGenero = idGenero
WHERE livro.anoLancamento >= '2015' AND livro.titulo LIKE '%a%' ORDER BY pagina;

SELECT COUNT(idLivro) AS 'Livros Cadastrados', 
MIN(pagina) AS 'Minimo de pagina', MAX(pagina) AS 'Máximo de pagina',
ROUND(avg(pagina),2) AS 'Media de pagina' FROM livro;

SELECT clube.nome, count(idLeitor) AS 'Leitores'
FROM participacao JOIN clube ON idClube = fkClube
JOIN leitor ON idLeitor = fkLeitor
group by clube.idClube;

SELECT leitor.nome, count(fkClube) AS 'Quantidade de Clubes'FROM leitor
JOIN participacao ON idLeitor = fkLeitor
GROUP BY idLeitor;

SELECT clube.nome, TRUNCATE(AVG(qtdEncontro), 1) AS 'Media'
FROM participacao
JOIN clube ON fkClube = idClube
JOIN leitor ON idLeitor = fkLeitor
WHERE (SELECT COUNT(idClube) FROM participacao as p
	WHERE p.fkClube = participacao.fkClube
) >= 3
GROUP BY clube.idClube, clube.nome;