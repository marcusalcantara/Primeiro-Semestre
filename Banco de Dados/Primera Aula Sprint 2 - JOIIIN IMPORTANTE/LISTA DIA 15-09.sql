-- EXERCICIO 1
USE sprint2;

CREATE TABLE pais(
idPais INT PRIMARY KEY auto_increment,
nome VARCHAR(30),
capital VARCHAR(40)
);

INSERT INTO pais VALUES
(default, 'Brasil', 'São Paulo'),
(default, 'Portugal', 'Porto'),
(default, 'Argentina', 'Buenos Aires'),
(default, 'Equador', 'Montevidel');

SELECT * FROM pais;

CREATE TABLE atleta (
idAtleta INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
modalidade VARCHAR(40),
qntMedalha INT,
fkPais INT NOT NULL,
CONSTRAINT AtletaPais
	foreign key (fkPais)
		REFERENCES pais(idPais)
) auto_increment = 5000;

INSERT INTO atleta VALUES 
	(default, 'Marcus', 'Futebol', 100, 1),
	(default, 'Renan', 'Basquete', 0, 1),
	(default, 'Mariana', 'Volei', 3, 2),
	(default, 'Nataly', 'Handball', 10, 1),
	(default, 'Manoel', 'Formula 1', 1, 2);
    
SELECT * FROM atleta 
	JOIN pais ON fkPais = idPais;
-- DROP TABLE atleta;

SELECT atleta.nome AS Nome, 
atleta.modalidade AS Modalidade, 
atleta.qntMedalha AS Medalhas, 
	pais.nome AS Pais
	FROM atleta JOIN pais ON idPais = fkPais;
    
SELECT atleta.nome AS Atleta, 
	pais.nome AS Pais
	FROM atleta JOIN pais ON idPais = fkPais;

SELECT * FROM atleta 
	JOIN pais ON idPais = fkPais
	WHERE pais.capital = 'Porto';
    
-- EXERCICIO 2
CREATE TABLE album(
idAlbum INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
tipo VARCHAR(20) CONSTRAINT chkTipo CHECK (tipo IN ('Digital', 'Fisico')),
dtLancamento DATE
);

-- DROP TABLE album;
INSERT INTO album VALUES
(default, '24K Magic', 'Digital', '1990-08-14'),
(default, 'Cumulonimbus','Fisico', '2026-08-11');

CREATE TABLE musica(
idMusica INT PRIMARY KEY auto_increment,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40),
fkAlbum INT NOT NULL,
CONSTRAINT fkAlbum 
	foreign key (fkAlbum)
		REFERENCES album (idAlbum)
);

INSERT INTO musica VALUES
(default, '24K Magic', 'Bruno Mars', 'Pop', 1),
(default, 'Locked', 'Bruno Mars', 'Pop', 1),
(default, 'Defensores da Arte do Gueto', 'Rashid', 'Rap', 2);

SELECT * FROM album
JOIN musica ON idAlbum = fkAlbum;

SELECT musica.titulo AS Titulo,
	album.nome AS Album
    FROM musica JOIN album ON idAlbum = fkAlbum;
    
SELECT * FROM musica JOIN album
	ON idAlbum = fkAlbum 
	WHERE tipo = 'Fisico';

-- EXERCICIO 3

USE sprint2;

CREATE TABLE pessoa(
idPessoa INT primary key auto_increment,
nome VARCHAR(45),
cpf CHAR(11)
);

INSERT INTO pessoa VALUES 
(default, 'Marcus', '11122233344'),
(default, 'Renan', '11122233355'),
(default, 'Mariana', '11122233366'),
(default, 'Nataly', '11122233377'),
(default, 'Matheus', '11122233388');

CREATE TABLE reserva(
idReserva INT PRIMARY KEY auto_increment,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME
);

truncate table reserva;
ALTER TABLE reserva ADD COLUMN fkPessoa INT NOT NULL;

ALTER TABLE reserva ADD CONSTRAINT fkPessoaReserva
	FOREIGN KEY(fkPessoa)
		REFERENCES pessoa(idPessoa);
        
INSERT INTO reserva VALUES
(default , '2026-08-08', '2026-09-09', '2026-10-10', 1),
(default , '2026-08-08', '2026-09-09', '2026-10-10', 2),
(default , '2026-08-08', '2026-09-09', '2026-10-10', 3),
(default , '2026-08-08', '2026-09-09', '2026-10-10', 4),
(default , '2026-08-08', '2026-09-09', '2026-10-10', 5);

SELECT * FROM pessoa
	JOIN reserva ON fkPessoa = idPessoa;
    
SELECT 
	pessoa.nome AS Pessoa,
	dtReserva AS Reserva,
    dtRetirada AS Retirada,
    dtDevolucao AS Devolução
    from pessoa JOIN reserva ON fkPessoa = idPessoa;

UPDATE reserva SET dtReserva = '2026-03-22'
WHERE idReserva = 1 AND idReserva = 2 AND idReserva = 5;
	
SELECT nome, dtReserva,
	CASE 
		WHEN dtReserva <= 2026-03-22 THEN 'Antigo'
        ELSE 'Novo'
	END AS dtReserva FROM reserva JOIN pessoa ON fkPessoa = idPessoa;

SELECT nome, IFNULL(dtReserva, 'Nulo') AS NomeReserva
FROM reserva JOIN pessoa ON fKPessoa = idPessoa;

-- EXERCICIO 4
USE sprint2;

CREATE TABLE pessoa1(
idPessoa1 INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
dtNasc DATE
) auto_increment = 1000;

INSERT INTO pessoa1 VALUES
(default, 'Marcus', '2006-08-14'),
(default, 'Renan', '2007-09-07'),
(default, 'Nataly', '2006-09-29'),
(default, 'Matheus', '2008-04-14'),
(default, 'Manoel', NULL);

CREATE TABLE pessoa2(
idPessoa2 INT primary KEY auto_increment,
nome VARCHAR(45),
dtNasc date
)auto_increment = 1000;

ALTER TABLE pessoa2 ADD COLUMN fkPessoa1 INT NOT NULL;

ALTER TABLE pessoa2 ADD CONSTRAINT fkPessoa1Pessoa2
	FOREIGN KEY(fkPessoa1)
		references pessoa1(idPessoa1);

INSERT INTO pessoa2 VALUES
(default, 'Felipe' , '2022-02-09', 1000),
(default, 'Ricardo' , '2002-09-22', 1001),
(default, 'Lucas' , '1990-11-12', 1002),
(default, 'Mono' , '2000-03-02', 1003),
(default, 'Gii' , '1990-06-11', 1004);
        
SELECT * FROM pessoa2 
	JOIN pessoa1 ON idPessoa1 = fkPessoa1;
    
SELECT pessoa2.nome AS NomedaPessoa,
pessoa2.dtNasc AS DataDeNascimento
from pessoa2 JOIN pessoa1 ON fkPessoa1 = idPessoa1;

SELECT pessoa2.nome, pessoa2.dtNasc,
	CASE
		WHEN pessoa2.dtNasc > '2022-01-01' THEN 'Novo'
		ELSE 'Tá veio' END AS 
        dtNasc FROM pessoa2 JOIN pessoa1 ON fkPessoa1 = idPessoa1;
        
SELECT pessoa1.nome, IFNULL(pessoa1.dtNasc, 'NULO') AS DataDeNascimento 
		FROM pessoa2 JOIN pessoa1 ON fkPessoa1 = idPessoa1; 

-- EXERCICIO 5
USE sprint2;
CREATE TABLE condutor(
idCondutor INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
cpf CHAR(11)
);

INSERT INTO condutor VALUES
(default, 'Marcus', '11122233399'),
(default, 'Renan', '11122244063'),
(default, 'Manoel', '11122288486'),
(default, 'Matheus', '11122299075'),
(default, 'Mariana', '11122211765');

CREATE TABLE habilitacao(
idHabilitacao INT PRIMARY KEY auto_increment,
categoria VARCHAR(5) CONSTRAINT chkCategoria CHECK (categoria IN ('A', 'B', 'A e B'))
);

ALTER TABLE habilitacao ADD column fkCondutor INT UNIQUE;

ALTER TABLE habilitacao ADD CONSTRAINT fkCondutorHabilitacao
	FOREIGN KEY (fkCondutor) 
		REFERENCES condutor(idCondutor);

ALTER TABLE habilitacao ADD COLUMN validade DATE;

DESCRIBE habilitacao;

INSERT INTO habilitacao VALUES
	(default, 'A', '1','2027-09-08'),
	(default,'A e B', '2','2027-02-28'),
	(default,'B', '3','2027-02-18'),
	(default,'A', '4','2027-10-08'),
	(default,'B', '5', NULL);
    
SELECT * FROM habilitacao JOIN condutor ON idCondutor = fkCondutor;

SELECT condutor.nome AS nomeCondutor, categoria AS HabilitacaoHein 
	FROM habilitacao JOIN condutor ON idCondutor = fkCondutor;
    
SELECT condutor.nome, 
	CASE 
		WHEN validade > '2027-05-22' 
		THEN 'SUSA' ELSE 'NAO SUSA' END AS Habilitacao FROM habilitacao JOIN condutor ON idCondutor = fkCondutor;
        
SELECT condutor.nome, IFNULL(validade, 'Porra meu') AS VALIDADE
	FROM habilitacao JOIN condutor ON idCondutor = fkCondutor;
    
-- EXERCICIO 6

CREATE TABLE farmacia(
farmacia int primary KEY auto_increment,
nome VARCHAR(45)
);

ALTER TABLE farmacia RENAME COLUMN farmacia TO idFarmacia;

INSERT INTO farmacia VALUES
(default , 'DrogaSIL'),
(default , 'DrogaLeste'),
(default , '24H Remedio'),
(default , 'SP FARMA'),
(default , 'Lalala');

CREATE TABLE endereco(
idEndereco INT PRIMARY KEY auto_increment,
rua VARCHAR(70),
numero INT,
cidade VARCHAR(70),
estado VARCHAR(45)
);

ALTER TABLE endereco ADD COLUMN fkFarmacia INT;

ALTER TABLE endereco ADD CONSTRAINT fkFarmaciaEndereco
	foreign key (fkFarmacia)
		REFERENCES farmacia(idFarmacia);
        
INSERT INTO endereco VALUES
	(default, 'Gilberto Silva', 50,'Chachacha', 'São Paulo', 1),
	(default, 'Cristiano',221,'Bahia', 'SP', 2),
	(default, 'Paulão', null,'São Paulo', 'São João', 3),
	(default, 'Figo da Silva', 53,'SP', 'Pirituba', 4),
	(default, 'Mertens de Lopez',3 , 'SP', 'La la land', 5);

CREATE TABLE farmaceutico(
idFarmaceutico INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
CPF CHAR(11)
);

ALTER TABLE farmaceutico ADD COLUMN fkFarmacia INT;

ALTER TABLE farmaceutico ADD CONSTRAINT fkFarmaciaFarmaceutico
	foreign key (fkFarmacia) REFERENCES farmacia(idFarmacia);
    
INSERT INTO farmaceutico VALUES
	(default, 'Marcus', '11122233344', 1),
	(default, 'Renan', '11133366688', 2),
	(default, 'Lucas', '11199922244', 3),
	(default, 'Marvin', '11122211144', 4),
	(default, 'Paulo', '11155577744', 5);
    
SELECT farmacia.nome, endereco.estado, farmaceutico.nome FROM farmacia 
	JOIN farmaceutico ON idFarmacia = farmaceutico.fkFarmacia 
    JOIN endereco ON idFarmacia = endereco.fkFarmacia;
    
SELECT farmacia.nome AS nomeDaFarmacia, farmaceutico.nome AS NomedoHomi 
FROM farmacia JOIN farmaceutico ON idFarmacia = farmaceutico.fkFarmacia
JOIN endereco ON idFarmacia = endereco.fkFarmacia; 

SELECT farmacia.nome,
CASE 
	WHEN farmacia.nome LIKE 'D%' THEN 'Começa com D'
    ELSE 'Não começa com D' END AS FIM
    FROM farmacia JOIN farmaceutico ON idfarmacia = farmaceutico.fkFarmacia
    JOIN endereco ON idFarmacia = endereco.fkFarmacia;
    
SELECT farmaceutico.nome AS NomeDoFarmaceutico, IFNULL(numero, 'Endereço nulo') AS Endereços 
FROM endereco 
	JOIN farmacia ON idFarmacia = endereco.fkFarmacia
	JOIN farmaceutico ON idFarmacia = farmaceutico.fkFarmacia;