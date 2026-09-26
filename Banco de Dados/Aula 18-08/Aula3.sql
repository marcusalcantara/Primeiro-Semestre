USE sprint1;

CREATE TABLE sensor (
id INT PRIMARY KEY auto_increment,
tipo VARCHAR(50) DEFAULT 'DHT11',
temperaturaIdeal FLOAT NOT NULL,
locall VARCHAR(20) UNIQUE,
statuss VARCHAR(40),
CONSTRAINT chkStatus CHECK (statuss IN ('Ativo' , 'Inativo')),
dataHora DATETIME DEFAULT current_timestamp
) auto_increment = 1000;

INSERT INTO sensor VALUES
	(default, 'LM35' , 29.2, 'Quandrante A' , 'Ativo', '2026-08-18 10:47:00');

INSERT INTO sensor (temperaturaIdeal, locall, statuss) VALUES
	(25.4, 'Quadrante B', 'Inativo'),
	(23.1, 'Quadrante C', 'Ativo');
    
SELECT * FROM sensor;

-- O COMANDO ABAIXO DARA ERRADO DE CONTRAINT
INSERT INTO sensor (temperaturaIdeal, statuss) VALUES
	(19.0,'Em manutenção');
    
ALTER TABLE sensor DROP CONSTRAINT chkStatus;

ALTER TABLE sensor ADD CONSTRAINT chkStatuss
	CHECK (statuss IN ('Ativo', 'Inativo' , 'Em manutenção'));

-- ALIAS - Apelido em inglês    
-- se tem espaço use aspas
SELECT tipo AS Tipo FROM sensor;

-- CONCAT - CONCATENAR
SELECT CONCAT(tipo, statuss) FROM sensor;
SELECT CONCAT(tipo, ' ', statuss) AS frase FROM sensor;
SELECT CONCAT('O tipo do sensor é ' , tipo, '',
		'e seu status é ', statuss) AS Frase FROM sensor;
 
 -- INSERINDO STATUS NULO PARA TRATAR
INSERT INTO sensor (temperaturaIdeal) VALUES
	(19.3);
    
SELECT * FROM sensor;

-- IFNULL - SE NULO
SELECT IFNULL (statuss, 'Não preenchido ') AS 'Status' FROM sensor;

SELECT CONCAT('O tipo do sensor é ' , tipo, '',
		'e seu status é ', IFNULL(statuss, 'Não preenchido')) AS Frase FROM sensor;
	
-- CONDIÇÃO - CASE
SELECT CASE
	WHEN temperaturaIdeal > 20 THEN 'Temperatura Alta'
    WHEN temperaturaIdeal = 20 THEN 'Temperatura Ideal'
    ELSE 'Temperatura não tratada'
    END AS Temperatura
    FROM sensor;
    
-- CONFIGURAR DATA
SELECT date_format (dataHora, '%d/%m/%Y %h:%i') as dataHora FROM sensor;

TRUNCATE TABLE sensor;