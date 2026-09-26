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

-- Exercicio 2
USE sprint2;
CREATE TABLE farmacia1(
idFarmica INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
cnpj VARCHAR(20)
);

ALTER TABLE farmacia1 RENAME COLUMN idFarmica TO idFarmacia;

INSERT INTO farmacia1 VALUES
	(default, 'Drogasil', '51129902222'),
	(default, 'SPFarm', '51129904444'),
	(default, 'Jhonhanthan', '51129905599');
SELECT * FROM farmacia1;

CREATE TABLE endereco1(
idEndereco INT PRIMARY KEY auto_increment,
rua VARCHAR(40),
numero INT,
bairro VARCHAR(40),
cidade VARCHAR(40)
);

ALTER TABLE endereco1 modify column fkFarmacia INT UNIQUE;

ALTER TABLE endereco1 ADD CONSTRAINT
	foreign key(fkFarmacia)
    REFERENCES farmacia(idFarmacia);
    
INSERT INTO endereco VALUES
	(default, null, null, null, null, 1),
	(default, 'Joao Lopez', 50, 'Itaquera', 'SP', 2),
	(default, 'Lucão Rego', 22, 'Jundiai', 'SP', 3),
	(default, 'Vivian me da dez', 510, 'Lalala', 'Santos', 3),
	(default, 'Joao Lopez', 50, 'Guaianazes', 'Pipoca', 1);
    
SELECT farmacia1.nome, endereco1.rua 
FROM farmacia1 JOIN endereco1 ON fkFarmacia = idFarmacia; 
    
CREATE TABLE farmaceutico1(
idFarmaceutico INT PRIMARY KEY,
nome VARCHAR(45),
crf VARCHAR(12),
turno VARCHAR(45),
CONSTRAINT chkTurno CHECK (turno in ('Manhã', 'Tarde', 'Noite'))
);