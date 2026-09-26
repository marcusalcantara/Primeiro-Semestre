use sprint2;

CREATE TABLE funcionario(
idFuncionario INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
area VARCHAR(45),
salario DECIMAL(10,2),
fkSupervisor INT,
CONSTRAINT fkFuncSuper
	FOREIGN KEY (fkSupervisor)
		REFERENCES funcionario(idFuncionario)
);

INSERT INTO funcionario (nome, salario, fkSuperVisor) VALUES
	('Brandão', 100.00, null),
	('Vivian', 99.00, 1),
	('Matheus', 96.00, 1),
    ('Pedro', 101.00, 2);
    
SELECT * FROM funcionario JOIN funcionario AS supervisor
	ON funcionario.fkSupervisor = supervisor.idFuncionario;

-- Sem o brandão    
SELECT funcionario.nome AS NomeFunc,
	supervisor.nome AS NomeSuper
    FROM funcionario JOIN funcionario AS supervisor
		ON funcionario.fkSupervisor = supervisor.idFuncionario;
        
-- Com o brandão
SELECT funcionario.nome AS NomeFunc,
	supervisor.nome AS NomeSuper
    FROM funcionario left JOIN funcionario AS supervisor
		ON funcionario.fkSupervisor = supervisor.idFuncionario;
        
SELECT funcionario.nome AS NomeFunc,
	ifnull(supervisor.nome, 'Supervisor') AS NomeSuper
    FROM funcionario left JOIN funcionario AS supervisor
		ON funcionario.fkSupervisor = supervisor.idFuncionario;
        
CREATE TABLE dependente(
idDependente INT,
fkFuncionario INT,
constraint pkComposta PRIMARY KEY (idDependente, fkFuncionario),
nome VARCHAR(45),
parentesco VARCHAR(45),
CONSTRAINT fkDepFunc foreign key (fkFuncionario)
	REFERENCES funcionario(idFuncionario)
);

INSERT INTO dependente VALUES
	(1, 2, 'Cintia', 'namorada'),
	(1, 3, 'Lola', 'pet'),
	(2, 3, 'Sebastian', 'pet'),
	(1, 4, 'Eliane', 'mãe');
    
-- SEM O BRANDÃO
SELECT funcionario.nome AS Func,
	dependente.nome AS Dependente
    FROM funcionario JOIN dependente
		ON idFuncionario = fkFuncionario;

-- APENAS O BRANDÃO
SELECT funcionario.nome AS func,
	dependente.nome AS Dependente
    FROM funcionario left JOIN dependente
		ON idFuncionario = fkFuncionario
        WHERE fkFuncionario is null;
        
SELECT f.idFuncionario AS 'ID Func',
	f.fkSupervisor AS 'ID Super',
	f.nome AS 'Nome Funcionario',
	s.nome AS 'Nome Supervisor',
    d.nome AS 'Nome Dependende'
    FROM funcionario AS f JOIN funcionario AS s
		ON f.fkSupervisor = s.idFuncionario
        JOIN dependente as d
        ON f.idFuncionario = d.fkFuncionario
        ORDER BY f.idFuncionario;
    
ALTER TABLE funcionario ADD CONSTRAINT SalarioPositivo
	CHECK(salario >= 0);
    
