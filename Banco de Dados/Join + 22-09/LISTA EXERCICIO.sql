CREATE database sprint2;
USE sprint2;

-- EXERCICIO 1
CREATE TABLE animal(
id INT primary key auto_increment,
nome VARCHAR(45),
especie VARCHAR(45),
raca VARCHAR(45),
idade INT
);

INSERT INTO animal VALUES
	(default, 'Rebe', 'Gato', 'Aquela', 10),
	(default, 'Snoopy', 'Cachorro', 'Shi-Tzu', 8),
	(default, 'Leonador', 'Sapo', 'Sim aquela', 10),
	(default, 'William', 'Esquilo', 'Aquela la', 1),
	(default, 'Isaac', 'Elefante', 'Monstro', 5);
    
ALTER TABLE animal RENAME COLUMN id TO idAnimal;
CREATE TABLE ficha(
id INT PRIMARY KEY auto_increment,
ultima_consulta DATE,
peso DECIMAL(10,2),
observacao VARCHAR(45),
vacina_em_dia CHAR(3), 
CONSTRAINT chkVacina CHECK (vacina_em_dia IN ('Sim', 'Não')),
fkAnimal INT NOT NULL
);

ALTER TABLE ficha ADD constraint 
	foreign key (fkAnimal)
		references animal(idAnimal);
        
INSERT INTO ficha VALUES
	(default, '2026-10-22', 100,'Esta acima do peso', 'Não',1),
	(default, '2025-09-22', 200,'Nada a dizer', 'Sim',2),
	(default, '2023-12-12', 100,null, 'Sim',3),
	(default, '2024-10-02', 200,'Diferente', 'Sim',4),
	(default, '2026-08-17', 300,'Esta magro', 'Sim',5);
    
select * from animal join ficha ON idAnimal = fkAnimal;

select animal.nome, animal.especie 
from animal JOIN ficha ON idAnimal = fkAnimal;

select animal.nome, animal.especie, animal.idade 
from animal join ficha on idAnimal = fkAnimal ORDER BY idade DESC;

select animal.nome from animal JOIN ficha on idAnimal = fkAnimal
	WHERE animal.especie LIKE '%Cachorro%';
    
SELECT animal.nome AS Pet, animal.especie AS Tipo 
FROM animal JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.nome, ficha.peso AS PesoKG, ficha.ultima_consulta AS Ultima_Consulta 
from animal JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.especie AS Nome, animal.idade*7 AS IdadeHumanaAproximada 
FROM animal JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.nome AS Nome_do_Pet, animal.raca AS Raça 
FROM animal JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.nome,
	CASE
	WHEN animal.idade < 2 THEN 'Filhote'
    WHEN animal.idade >= 2 AND animal.idade <= 7 THEN 'Adulto'
		ELSE 'Idoso' END AS Fase_da_Vida 
		FROM animal JOIN ficha ON idAnimal = fkAnimal; 
        
SELECT animal.nome,
	CASE 
    WHEN ficha.vacina_em_dia = 'Sim' THEN 'Vacinado'
    ELSE 'Pendente' END AS vacinacao 
    FROM animal JOIN ficha ON idAnimal = fkAnimal;
    
SELECT ficha.peso AS Peso,
	CASE 
    WHEN peso < 5 THEN 'Pequeno'
    WHEN peso >= 5 AND peso <= 20 THEN 'Médio'
    ELSE 'Grande' END AS Porte 
    FROM animal JOIN ficha ON idAnimal = fkAnimal;
    
SELECT animal.nome AS Nome,
	CASE 
    WHEN animal.especie LIKE '%Cachorro%' THEN 'Canino'
    WHEN animal.especie LIKE '%Gato%' THEN 'Felino'
    ELSE 'Outro' END AS especie_tipo 
    FROM animal JOIN ficha ON idAnimal = fkAnimal;
    
SELECT animal.nome, IFNULL(observacao, 'Nenhuma Observação') AS Observação
FROM animal JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.nome, IFNULL(observacao, 'Sem ficha') AS OBS
FROM animal LEFT JOIN ficha ON idAnimal = fkAnimal;

SELECT animal.nome, ficha.peso, ficha.ultima_consulta
FROM animal JOIN ficha ON idAnimal = fkAnimal;

SELECT concat(animal.nome,' ',animal.especie,' ', ficha.peso) AS Resumo
FROM animal JOIN ficha ON idAnimal = fkAnimal;

update animal SET raca = null WHERE idAnimal = 1;

SELECT animal.nome, IFNULL(raca, 'Raça não informada') AS Raça
FROM animal JOIN ficha ON idAnimal = fkAnimal;

-- Exercício 2
USE sprint2;

CREATE TABLE farmacia1(
    idFarmica INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj VARCHAR(20)
);

ALTER TABLE farmacia1 
RENAME COLUMN idFarmica TO idFarmacia;

INSERT INTO farmacia1 VALUES
(DEFAULT, 'Farmácia Saúde', '12.345.678/0001-01'),
(DEFAULT, 'Drogaria Central', '23.456.789/0001-02'),
(DEFAULT, 'Farmácia Bem Estar', '34.567.890/0001-03');

SELECT * FROM farmacia1;


CREATE TABLE endereco1(
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40),
    numero INT,
    bairro VARCHAR(40),
    cidade VARCHAR(40)
);

ALTER TABLE endereco1 
ADD COLUMN fkFarmacia INT UNIQUE;

ALTER TABLE endereco1 
ADD CONSTRAINT fk_endereco_farmacia
FOREIGN KEY (fkFarmacia)
REFERENCES farmacia1(idFarmacia);


INSERT INTO endereco1 VALUES
(DEFAULT, 'Joao Lopez', 50, 'Itaquera', 'SP', 1),
(DEFAULT, 'Lucão Rego', 22, 'Jundiai', 'SP', 2);

SELECT * FROM endereco1;


SELECT 
    farmacia1.nome,
    endereco1.rua
FROM farmacia1
JOIN endereco1 
ON endereco1.fkFarmacia = farmacia1.idFarmacia;


CREATE TABLE farmaceutico1(
    idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    crf VARCHAR(12),
    turno VARCHAR(45),
    fkFarmacia INT,
    
    CONSTRAINT chkTurno 
    CHECK (turno IN ('Manhã', 'Tarde', 'Noite')),
    
    CONSTRAINT fk_farmaceutico_farmacia
    FOREIGN KEY (fkFarmacia)
    REFERENCES farmacia1(idFarmacia)
);

INSERT INTO farmaceutico1 
VALUES
(DEFAULT, 'Carlos Silva', 'CRF12345', 'Manhã', 1),
(DEFAULT, 'Ana Souza', 'CRF23456', 'Tarde', 1),
(DEFAULT, 'João Oliveira', 'CRF34567', 'Noite', 2),
(DEFAULT, 'Mariana Santos', 'CRF45678', 'Manhã', 2),
(DEFAULT, 'Pedro Costa', 'CRF56789', 'Tarde', 3);

SELECT nome, cnpj
FROM farmacia1;

SELECT *
FROM farmaceutico1
WHERE turno = 'Noite';

SELECT *
FROM endereco1
ORDER BY cidade ASC;

SELECT nome, crf
FROM farmaceutico1;

SELECT 
    nome AS 'Estabelecimento',
    cnpj AS 'Documento'
FROM farmacia1;

SELECT 
    nome AS 'Profissional',
    turno AS 'Horario de Trabalho'
FROM farmaceutico1;

SELECT 
    rua AS 'Logradouro',
    numero AS 'Num.'
FROM endereco1;

SELECT 
    CONCAT(rua, ', ', numero) AS 'Endereço Completo'
FROM endereco1;

SELECT nome,
    CASE
        WHEN turno = 'Manhã' THEN '06h-12h'
        WHEN turno = 'Tarde' THEN '12h-18h'
        ELSE '18h-00h'
    END AS 'periodo'
FROM farmaceutico1;

SELECT nome,
    CASE
        WHEN LEFT(cnpj, 1) = '1' THEN 'Matriz'
        ELSE 'Filial'
    END AS 'tipo_cnpj'
FROM farmacia1;

SELECT bairro,
    CASE
        WHEN bairro = 'Itaquera' THEN 'Zona Leste'
        WHEN bairro = 'Jundiai' THEN 'Outra'
        ELSE 'Outra'
    END AS 'zona'
FROM endereco1;

SELECT nome,
    CASE
        WHEN turno = 'Noite' THEN 'Adicional Noturno'
        ELSE 'Normal'
    END AS 'carga_horaria'
FROM farmaceutico1;

SELECT 
    farmacia1.nome,
    IFNULL(endereco1.rua, 'SEM ENDERECO') AS rua
FROM farmacia1
LEFT JOIN endereco1
ON farmacia1.idFarmacia = endereco1.fkFarmacia;

SELECT 
    farmaceutico1.nome,
    farmaceutico1.crf,
    farmacia1.nome
FROM farmaceutico1
INNER JOIN farmacia1
ON farmaceutico1.fkFarmacia = farmacia1.idFarmacia;

SELECT 
    farmacia1.nome AS 'Farmácia',
    endereco1.cidade AS 'Cidade',
    farmaceutico1.nome AS 'Farmacêutico'
FROM farmacia1
JOIN endereco1
ON farmacia1.idFarmacia = endereco1.fkFarmacia
JOIN farmaceutico1
ON farmacia1.idFarmacia = farmaceutico1.fkFarmacia;

SELECT 
    CONCAT(
        farmaceutico1.nome, ' - ',
        farmaceutico1.crf, ' - ',
        farmacia1.nome
    ) AS 'info'
FROM farmaceutico1
INNER JOIN farmacia1
ON farmaceutico1.fkFarmacia = farmacia1.idFarmacia;

SELECT 
    rua,
    IFNULL(bairro, 'Bairro não informado') AS bairro
FROM endereco1;

-- EXERCICIO 3

CREATE TABLE artista1(
    idArtista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    generoMusical VARCHAR(45),
    pais VARCHAR(45),
    ativo BOOLEAN
);


CREATE TABLE musica1(
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    duracaoSegundos INT,
    anoLancamento INT,
    fkArtista INT,
    
    CONSTRAINT fkMusicaArtista
    FOREIGN KEY (fkArtista)
    REFERENCES artista1(idArtista)
);

INSERT INTO artista1
VALUES
(DEFAULT, 'Eminem', 'Rap', 'Estados Unidos', TRUE),
(DEFAULT, 'Emicida', 'Rap', 'Brasil', TRUE),
(DEFAULT, 'Michael Jackson', 'Pop', NULL, FALSE);


INSERT INTO musica1
VALUES
(DEFAULT, 'Lose Yourself', 326, 2002, 1),
(DEFAULT, 'Mockingbird', 250, 2004, 1),
(DEFAULT, 'AmarElo', 335, 2019, 2),
(DEFAULT, 'Passarinhos', 220, 2015, 2),
(DEFAULT, 'Billie Jean', 294, 1982, 3),
(DEFAULT, 'Música Desconhecida', 180, 2023, NULL);


SELECT * FROM artista1;

SELECT * FROM musica1;

SELECT titulo, duracaoSegundos
FROM musica1;


SELECT *
FROM musica1
WHERE anoLancamento > 2020;

SELECT *
FROM artista1
ORDER BY nome ASC;

SELECT *
FROM musica1
WHERE duracaoSegundos > 200;


SELECT
    titulo AS 'Nome da Música',
    anoLancamento AS 'Ano'
FROM musica1;

SELECT
    nome AS 'Cantor/Banda',
    generoMusical AS 'Estilo'
FROM artista1;

SELECT
    duracaoSegundos / 60 AS 'Duração (min)'
FROM musica1;


SELECT
    titulo AS 'Faixa',
    anoLancamento AS 'Lançamento'
FROM musica1;

SELECT
    titulo,
    CASE
        WHEN anoLancamento < 2000 THEN 'Clássico'
        WHEN anoLancamento BETWEEN 2000 AND 2015 THEN 'Moderno'
        ELSE 'Atual'
    END AS 'era'
FROM musica1;

SELECT
    nome,
    CASE
        WHEN ativo = TRUE THEN 'Em atividade'
        ELSE 'Inativo'
    END AS 'status'
FROM artista1;


SELECT
    titulo,
    CASE
        WHEN duracaoSegundos < 180 THEN 'Curta'
        WHEN duracaoSegundos BETWEEN 180 AND 300 THEN 'Normal'
        ELSE 'Longa'
    END AS 'tamanho'
FROM musica1;


SELECT
    nome,
    CASE
        WHEN pais = 'Brasil' THEN 'Nacional'
        ELSE 'Internacional'
    END AS 'origem'
FROM artista1;

SELECT
    nome,
    IFNULL(pais, 'Pais desconhecido') AS pais
FROM artista1;

SELECT
    musica1.titulo,
    IFNULL(artista1.nome, 'ARTISTA DESCONHECIDO') AS artista
FROM musica1
LEFT JOIN artista1
ON musica1.fkArtista = artista1.idArtista;

SELECT
    musica1.titulo,
    musica1.anoLancamento,
    artista1.nome
FROM musica1
INNER JOIN artista1
ON musica1.fkArtista = artista1.idArtista;

SELECT
    CONCAT(
        musica1.titulo, ' - ',
        artista1.nome, ' - ',
        musica1.anoLancamento
    ) AS 'catalogo'
FROM musica1
INNER JOIN artista1
ON musica1.fkArtista = artista1.idArtista;

SELECT
    artista1.nome,
    musica1.titulo
FROM musica1
RIGHT JOIN artista1
ON musica1.fkArtista = artista1.idArtista;

--  EXERCICIO 4