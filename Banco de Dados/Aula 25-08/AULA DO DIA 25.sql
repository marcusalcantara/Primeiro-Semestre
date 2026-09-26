USE sprint1;

CREATE TABLE cadastro(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(50) not null,
cpf CHAR(11),
dtNasc DATE,
altura FLOAT,
salario DECIMAL(10,2),
email VARCHAR(60),
constraint chkEmail CHECK (email LIKE '%@%')
) auto_increment = 2000;

INSERT INTO cadastro (nome, dtNasc, salario, email) VALUES
	('Rick' , '2000-01-01' , 3000.99, 'rick@gmail.com'),
	('Rock' , '2002-03-01' , 600.99, 'rock@gmail.com');
    
-- DROP TABLE cadastro;

ALTER TABLE cadastro MODIFY COLUMN cpf CHAR(11) unique,
	MODIFY COLUMN email VARCHAR(60) not null;
    
DESCRIBE cadastro;

ALTER TABLE cadastro ADD CONSTRAINT chkSalario
	CHECK (salario >=0 );
    
ALTER TABLE cadastro ADD COLUMN dtCadastro DATETIME DEFAULT current_timestamp;

-- CURDATE - APENAS A DATA E A HORA FICA 00:00:00
UPDATE cadastro SET dtCadastro = curdate()
	WHERE id = 2000;
        
-- NOW - DATA E HORA COMPLETA
UPDATE cadastro SET dtCadastro = now()
	WHERE id = 2001;
    
SELECT * FROM cadastro;

SELECT ifnull  (cpf, 'Estrangeiro') as CPF, 
	concat('Nome é ' ,  nome) as NOME,
    case
		WHEN salario > 1000 THEN 'Top'
        ELSE 'Não top'
        END as SALARIO
        FROM cadastro;
        
SELECT concat('Cadastro realizado' , nome, ' tem o cpf ', 
	IFNULL(cpf, 'Sem cpf'), ' e o salario é ',
    CASE
    WHEN salario > 1000 THEN 'Ganha bem'
    ELSE 'Ganha mais ou menos'
    END) AS FRASE_COMPLETA FROM cadastro; 

SELECT dtNasc, 
	timestampdiff (YEAR , dtNasc, now()) AS IDADE FROM cadastro;

SELECT * FROM cadastro;    
UPDATE cadastro SET cpf = '01234567890' , altura = 1.67,
	salario = NULL WHERE id = 2000;
    
SELECT cpf FROM cadastro WHERE cpf is null;

ALTER TABLE cadastro ADD COLUMN statusCadastro TINYINT,
	ADD CONSTRAINT chkStatusCadastro
		CHECK(statusCadastro IN (0,1));
        
