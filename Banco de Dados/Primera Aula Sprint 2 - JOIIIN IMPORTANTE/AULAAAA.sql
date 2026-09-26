-- SPRINT 2 - MODELAGEM DE DADOS
-- AULA 6

CREATE DATABASE sprint2;
USE sprint2;

-- Criar a tabela resposavel, pois ela não tem FK
CREATE TABLE responsavel (
idResponsavel INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
salario DECIMAL(10,2)
) auto_increment = 5000;

INSERT INTO responsavel VALUES
	(default, 'Jow', 1.88),
	(default, 'Jarry', 1.48),
	(default, 'Jan', 1.98);
    
CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
cnpj CHAR(15) UNIQUE,
fkResponsavel INT NOT NULL UNIQUE,
CONSTRAINT fkEmpresaResponsa
	foreign key (fkResponsavel)
		REFERENCES responsavel(idResponsavel)
);

INSERT INTO empresa VALUES
	(default , 'C6 Bank', null, 5000),
	(default , 'Safra', null, 5001),
	(default , 'Stefanini', null, 5002);

-- NOSSO PRIMEIRO JOIN
-- JUNÇÃO, ASSOCIAÇÃO
-- Não existe JOIN sem ON

SELECT * FROM responsavel
	JOIN empresa ON fkResponsavel = idResponsavel;
    
SELECT r.nome AS Responsa,
	e.nome AS NomeEmpresa
    FROM empresa AS e JOIN responsavel AS r
		ON idResponsavel = fkResponsavel;
        
CREATE TABLE aluno(
ra CHAR(8) primary key,
nome VARCHAR(45),
bairro VARCHAR(25),
fkEmpresa INT NOT NULL
);

ALTER TABLE aluno ADD CONSTRAINT fkEmpresaAluno
	FOREIGN KEY (fkEmpresa)
		REFERENCES empresa(idEmpresa);
        
INSERT INTO aluno VALUES
	('01262999', 'Jonas', 'Paraiso', 1),
	('01262998', 'Jana', 'Perdizes', 1),
	('01262997', 'Jeremias', null, 2),
	('01262996', 'Januário', null, 3);
    
SELECT * FROM empresa
	JOIN aluno ON fkEmpresa = idEmpresa;
    
SELECT empresa.nome as Empresa,
	aluno.nome as Aluno,
    responsavel.nome as Responsavel
    FROM empresa JOIN responsavel
		ON idResponsavel = fkResponsavel
        JOIN aluno
        ON idEmpresa = fkEmpresa;
        
SELECT responsavel.nome as Responsa,
	empresa.nome as NomeEmpresa
    FROM empresa JOIN responsavel
		ON idResponsavel = fkResponsavel
		WHERE empresa.nome = 'C6 Bank';