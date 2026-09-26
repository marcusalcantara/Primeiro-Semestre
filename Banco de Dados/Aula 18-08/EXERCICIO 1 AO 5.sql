USE sprint1;

CREATE TABLE jogo1(
id INT PRIMARY KEY auto_increment,
nome VARCHAR (30),
diretor VARCHAR (30),
genero VARCHAR (30),
lancamento DATE,
nota INT,
CONSTRAINT chkNota CHECK (nota IN (0, 1 , 2, 3, 4, 5, 6, 7, 8, 9, 10)),
quantidade INT
);

INSERT INTO jogo1 (nome, diretor, genero, lancamento, nota, quantidade) VALUES

('Free Fire' , 'Friza' , 'Tiro' , '2018-08-08' , 10, 1),
('PUGB' , 'Vivian' , 'Tiro' , '2015-07-02' ,9, 5),
('Sonic' , 'JP' , 'Arcade' , '2012-02-23' , 6, 43),
('Rocket League' , 'Galvão' , 'Carro' , '2023-08-08' , 2, 21),
('Mario' , 'Luiz' , 'Arcade' , '1950-11-22' , 10, 13);

SELECT * FROM jogo1;

/*TRUNCATE TABLE jogo1;*/

ALTER TABLE jogo1 ADD COLUMN valores VARCHAR(50);

ALTER TABLE jogo1 ADD CONSTRAINT chkValores 
	CHECK (valores IN ('fisica', 'digital'));

UPDATE jogo1 SET valores = 'fisica'
	WHERE id = 11;

UPDATE jogo1 SET valores = 'fisica'
	WHERE id = 12;

UPDATE jogo1 SET valores = 'digital'
	WHERE id = 13;

UPDATE jogo1 SET valores = 'fisica'
	WHERE id = 14;

UPDATE jogo1 SET valores = 'digital'
	WHERE id = 15;

SELECT * FROM jogo1
	WHERE YEAR (lancamento) >= 2015;
    
SELECT * FROM jogo1
	WHERE valores = 'fisica' and nome LIKE '%a%';
    
SELECT * FROM jogo1
	WHERE diretor NOT LIKE '%e%';
    
ALTER TABLE jogo1 ADD CONSTRAINT chknota 
	CHECK (nota >= 0 and nota <= 10);

SELECT * FROM jogo1
	WHERE genero = 'Tiro' and quantidade >= 0;
    
DELETE FROM jogo1
	WHERE quantidade <1;
    
ALTER TABLE jogo1 RENAME COLUMN diretor TO criador;

SELECT * FROM jogo1;

DESCRIBE jogo1;

TRUNCATE TABLE jogo1;
/*AQUI COMEÇA O EXERCICIO 2*/

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
categoria VARCHAR (20), 
CONSTRAINT chkCategoria CHECK (categoria IN  ('individual', 'coletivo')),
numeroJogadores INT,
estreia DATE,
paisOrigem VARCHAR (30)
);

INSERT INTO esporte (nome, categoria, numeroJogadores, estreia, paisOrigem) VALUES 
	('Futebol', 'coletivo' , '22', '1912-10-10' , 'Brasil' ),
	('Boxe', 'individual' , '2', '1993-12-19' , 'Estados Unidos' ),
	('Futebol', 'coletivo' , '25', '1990-08-11' , 'Inglaterra' ),
	('Basquete', 'coletivo' , '10', '1907-06-15' , 'Colombia' ),
	('Volei', 'coletivo' , '2', '1904-02-19' , 'China' );
    
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL;
    
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade 
	CHECK (popularidade IN (popularidade >=0 AND popularidade <=10));
    
DESCRIBE esporte;
    
ALTER TABLE esporte DROP CONSTRAINT chkPopularidade;
	
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade 
	CHECK (popularidade >=0 AND popularidade <=10);
    
ALTER TABLE esporte DROP COLUMN popularidade;

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL (3,1);

UPDATE esporte SET popularidade = 10.0
	WHERE ID = 1;

UPDATE esporte SET popularidade = 9.5
	WHERE ID = 2;
    
UPDATE esporte SET popularidade = 7.3
	WHERE ID = 3;

UPDATE esporte SET popularidade = 4.8
	WHERE ID = 4;

UPDATE esporte SET popularidade = 8.5
	WHERE ID = 5;

SELECT * FROM esporte;

SELECT nome FROM esporte
	ORDER BY popularidade ASC;
    
SELECT nome FROM esporte
	WHERE YEAR(estreia) >= 2000;
    
DESCRIBE esporte;

ALTER TABLE esporte ADD CONSTRAINT chkEstreia CHECK (estreia >= '1896-04-06');

ALTER TABLE esporte DROP CONSTRAINT chkCategoria;

SELECT nome FROM esporte
	WHERE paisOrigem LIKE "_a%";
    
describe esporte;

SELECT * FROM esporte
	WHERE numeroJogadores >= 4 AND numeroJogadores <= 11;
    
DELETE FROM esporte
	WHERE id = 1 OR id = 3 OR id = 5;
    
/*AQUI COMEÇA O EXERCICIO 3*/

CREATE DATABASE desenho;

USE desenho;

CREATE TABLE desenhoAnimado (
id INT PRIMARY KEY auto_increment,
titulo VARCHAR (50),
dtLanca DATE,
emissora VARCHAR(50),
classifcacao INT,
statuss VARCHAR (15),
nota INT,
CONSTRAINT chkNota CHECK (nota >= 1 AND nota <=5)
);

DESCRIBE desenhoAnimado;

ALTER TABLE desenhoAnimado RENAME COLUMN classifcacao TO classificacao;

INSERT INTO desenhoAnimado VALUE
	(10, 'Apenas um Show', '1990-12-08', 'Globo', '5', 'Ativo', 5);
    
DESCRIBE desenhoAnimado;

INSERT INTO desenhoAnimado (titulo, dtLanca, emissora, classificacao, statuss, nota) VALUES
('Bob Esponja', '1940-09-23', 'SBT', 0, 'Ativo', 5),
('Pica Pau', '1967-12-22', 'Record', 8, 'Ativo', 4),
('Chaves Animado', '1990-02-12', 'SBT', 0, 'Ativo', 5),
('Caverna do Dragão', '1920-10-20', 'Cultura', 0, 'Inativo', 4);

TRUNCATE TABLE desenhoAnimado;

SELECT * FROM desenhoAnimado;

SELECT * FROM desenhoAnimado
	WHERE classificacao <= '14';
    
SELECT * FROM desenhoAnimado
	WHERE emissora = 'SBT';

UPDATE desenhoAnimado SET statuss = 'Exibindo'
	WHERE id = '10' OR id = '11' OR id = '12';

UPDATE desenhoAnimado SET statuss = 'Finalizado'
	WHERE id = '13';
    
UPDATE desenhoAnimado SET statuss = 'Cancelado'
	WHERE id = '14';
        
ALTER TABLE desenhoAnimado ADD CONSTRAINT chkStatuss 
	CHECK (statuss = 'Exibindo' OR statuss = 'Finalizado' OR statuss = 'Cancelado');

UPDATE desenhoAnimado SET statuss = 'Finalizado'
	WHERE id = 10 OR id = 11;
    
DELETE FROM desenhoAnimado 
	WHERE id = 12;
    
SELECT * FROM desenhoAnimado
	WHERE titulo LIKE 'B%';
    
ALTER TABLE desenhoAnimado RENAME COLUMN classificacao TO classificacaoIndicativa;

DESCRIBE desenhoAnimado;

UPDATE desenhoAnimado SET nota = 2 , dtLanca = '1993-08-02'
	WHERE id = 11;
    
SELECT * FROM desenhoAnimado;

TRUNCATE TABLE desenhoAnimado;

ALTER TABLE desenhoAnimado DROP CONSTRAINT chkStatuss;

/*AQUI COMEÇA O EXERCICIO 4*/

CREATE DATABASE estoque;

USE estoque;

CREATE TABLE misteriosSA (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
dtCompra DATE,
preco DECIMAL(10, 2),
peso INT,
dtRetirada DATE
);

DROP TABLE misteriossa;

INSERT INTO misteriosSA (nome, dtCompra, preco, peso) VALUES
('Biscoito' , '2023-08-05', '20.5', 200),
('Batata' , '2025-10-25', '22.4', 100),
('Chocolate' , '2025-03-15', '10.5', 300),
('Morango' , '2024-04-19', '14.5', 400),
('Salgadinho' , '2023-10-27', '11.5', 250);

SELECT * FROM misteriosSA;

SELECT nome, dtCompra, dtRetirada, id FROM misteriosSA ORDER BY dtCompra;

UPDATE misteriosSA SET dtRetirada = '2026-08-20'
	WHERE id = 1;
    
ALTER TABLE misteriosSA RENAME COLUMN id TO idComida;

UPDATE misteriosSA SET nome = 'Biscoitos Scooby'
	WHERE idComida = 1 or idComida = 2 or idComida = 3;

UPDATE misteriosSA SET nome = 'Cachorro Quente'
	WHERE idComida = 4 or idComida = 5;

ALTER TABLE misteriosSA ADD CONSTRAINT chkNome 
	CHECK (nome = 'Biscoitos Scooby' OR nome = 'Cachorro Quente');

SELECT idComida , nome, preco, peso, dtCompra AS 'data da compra' , dtRetirada AS 'data retirada' FROM misteriosSA
	WHERE nome = 'Biscoitos Scooby';
	
SELECT * FROM misteriosSA
	WHERE dtCompra < '2024-07-25';
    
SELECT * FROM misteriosSA
	WHERE preco >= 30.50;
    
TRUNCATE TABLE misteriosSA;

/*AQUI COMEÇA O EXERCICIO 5*/

CREATE DATABASE vingadores;
USE vingadores;

CREATE TABLE heroi(
id INT PRIMARY KEY auto_increment,
nome VARCHAR (45),
versao VARCHAR (45),
habilidade VARCHAR(45),
altura INT
);

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Homem de Ferro', 'Homem de Ferro 1', 'Voar', '177'),
('Hulk', 'Vingadores', 'Super Força', '200'),
('Homem Aranha', 'Vingadores', 'Força', '199'),
('Viuva Negra', 'Viuva Negra', 'Rapidez', '182'),
('Visão', 'Vingadores', 'Inteligência', '132');

SELECT * FROM heroi;

ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN; 

DESCRIBE heroi;

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

DELETE FROM heroi	
	WHERE id = 3;
    
INSERT INTO heroi (nome, versao, habilidade, altura, regeneracao) VALUES
	('Wolverine' , 'Deadpool x Wolverine', 'Garra', 200, TRUE);
    
TRUNCATE TABLE heroi;

SELECT * FROM heroi
	WHERE nome LIKE 'C%' OR nome LIKE 'H%';
    
SELECT * FROM heroi
	WHERE nome NOT LIKE '%A%';
    
SELECT nome FROM heroi
	WHERE altura > 190;
    
SELECT * FROM heroi 
	WHERE altura > 180 ORDER BY nome DESC;
    
TRUNCATE TABLE heroi;