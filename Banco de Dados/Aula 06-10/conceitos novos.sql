	USE sprint2;
    CREATE TABLE pessoa3(
    idPessoa int primary key auto_increment,
    nome varchar(45), -- + sobrenome = atributo composto,
    sobrenome VARCHAR(45),
    dataNasc DATE, -- idade = atributo derivado,
    cep CHAR(8),
    numEndereco VARCHAR(10),
    complemento VARCHAR(45), -- + cep + endereco = endereco composto
    emailPessoal VARCHAR(45),
    emailInstitucional VARCHAR(45),
    fkPai INT,
		constraint fkFilhodoPai foreign key (fkPai)
			references pessoa3(idPessoa),
	fkMae INT,
		constraint fkFilhodaMae foreign key (fkMae)
			references pessoa3(idPessoa)
    );
    
    -- INSERT INTO pessoa3 (nome, sobrenome, dataNasc, fkPai, fkMae) VALUES
		-- ('Marcus', 'Alcantara', '2006-08-14', null, null),
		-- ('Ana', 'Silva', '1980-02-06', null, null),
		-- ('Marcelo', 'Alcantara', '1978-01-20', null, null);
        
	    INSERT INTO pessoa3 (nome, sobrenome, dataNasc, fkPai, fkMae) VALUES
		('Iracema', 'Cena', null, null, null),
		('Edmundo', 'Cena', null, null, null);
	
        
UPDATE pessoa3 SET fkPai = 2, fkMae= 3
	WHERE idPessoa = 1;
    
SELECT filho.nome AS Filho,
	pai.nome AS Pai,
    mae.nome AS Mãe,
    vovoPaterno.nome AS Vovô,
    voPaterno.nome AS Vovó
    FROM pessoa3 AS filho 
    JOIN pessoa3 AS pai
		ON filho.fkPai = pai.idPessoa
	JOIN pessoa3 as mae
		ON filho.fkmae = mae.idPessoa
	JOIN pessoa3 AS vovoPaterno
		ON pai.fkPai = vovoPaterno.idPessoa
	JOIN pessoa3 AS voPaterno
		ON pai.fkMae = voPaterno.idPessoa;
    
    
UPDATE pessoa3 SET fkPai = 5, fkMae = 4
	WHERE idPessoa = 3;
    
SELECT DISTINCT sobrenome FROM pessoa3;
SELECT DISTINCT nome FROM pessoa3;

SELECT nome FROM pessoa3 order by nome LIMIT 3;

SELECT timestampdiff(YEAR, dataNasc, now()) Idade FROM pessoa3;