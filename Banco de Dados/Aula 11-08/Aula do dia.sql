USE sprint1;

-- CRIA A TABELA EMPRESA
CREATE TABLE empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
dtCriacao DATE,       -- 'YYYY-MM-DD'
cnpj CHAR(18) UNIQUE, -- 01.234.567/0001-89
faturamento DECIMAL (10,2)
);

/* 
TIPOS DE NÚMEROS DECIMAIS
FLOAT - 7 CARACTERES 12345,67
DOUBLE - 15 CARACTERES 12345678909,8765
DECIMAL(P1,P2) - (5,2) 123,45
				 (3,1) 12,3
                 (7,4) 123,4567
*/

-- DESCREVER OS CAMPOS DA TABELA 
DESCRIBE empresa;

INSERT INTO empresa VALUES
	(default, 'Stefanini', '1960-01-01', null, 1000.99);
    
INSERT INTO empresa (nome, faturamento) VALUES
	('C6Bank' , 2100.98),
    ('Deloite' , 999.97);
    
SELECT * FROM empresatop;

-- EXIBIR A EMPRESA CUJO O NOME É STEFANINI
SELECT nome FROM empresa
	WHERE nome = 'Stefanini';
    
-- EXIBIR O NOME DA EMPRESA QUE É DIFERENTE DE STEFANINI
SELECT nome FROM empresa
	WHERE nome <> 'Stefanini';
    
-- EXIBIR AS EMPRESAS QUE COMEÇAM COM A LETRA S
SELECT nome FROM empresa
	WHERE nome LIKE 'S%';

-- EXIBIR AS EMPRESAS ONDE A SEGUNDA LETRA É T
SELECT nome FROM empresa
	WHERE nome LIKE '_t%';
    
-- AULA 2 - novos comandos
SELECT * FROM empresa;

-- ALTER TABLE - ALTERA OS CAMPOS DA TABELA
ALTER TABLE empresa MODIFY COLUMN nome VARCHAR(25);
DESCRIBE empresa;

ALTER TABLE empresa RENAME COLUMN dtCriacao TO dataCriacao;

ALTER TABLE empresa ADD COLUMN responsavel VARCHAR (20);

ALTER TABLE empresa DROP COLUMN cnpj;

SELECT * FROM empresa;

-- ATUALIZAR UMA LINHA QUE JA EXISTE//
UPDATE empresa SET responsavel = 'Andresa'
	WHERE id = 2;
    
-- EXCLUIR UMA LINHA QUE JA EXISTE
DELETE FROM empresa 
	WHERE id = 3;

SELECT nome FROM empresa
	WHERE id = 1 OR id = 2;

SELECT nome FROM empresa
	WHERE id = 1 IN (1,2);

SELECT nome FROM empresa
	WHERE id = 1 NOT IN (1,2);
	
RENAME TABLE empresa TO empresaTop;

TRUNCATE TABLE empresaTop;

INSERT INTO empresaTOP (nome) VALUES
	('Sptech');

SELECT * FROM empresaTop;

ALTER TABLE empresaTop auto_increment = 10000;

