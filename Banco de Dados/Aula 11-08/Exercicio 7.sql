
USE sprint1;
CREATE TABLE carro(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(40),
placa CHAR(7)
);

INSERT INTO carro (id, nome, placa) VALUES
(1000, 'Camaro' , 'LKUJAAS');

SELECT * FROM carro;

INSERT INTO carro (nome, placa) VALUES
('Gol Quadrado' , 'AABBCCD'),
('Gol Bolinha' , 'AABBCPP'),
('Gol Triangulo' , 'AABBCEE');

TRUNCATE TABLE carro;

INSERT INTO carro (nome)  VALUE 
('Lalala'),
('Oooopa'),
('Makivivi');

DESCRIBE carro;

ALTER TABLE carro MODIFY COLUMN nome VARCHAR(28);

DESCRIBE carro;

ALTER TABLE carro ADD COLUMN ano CHAR (8);
SELECT * FROM carro;

UPDATE carro SET placa = 'APPEDDF' 
	WHERE id = 1004;  
    
UPDATE carro SET placa = 'APPEBGS' 
	WHERE id = 1005;  
    
UPDATE carro SET placa = 'APPERRT' 
	WHERE id = 1006;  
    
UPDATE carro SET ano = '2003'
	WHERE id = 1000;

UPDATE carro SET ano = '2020'
	WHERE id = 1001;
    
UPDATE carro SET ano = '1997'
	WHERE id = 1002;
    
UPDATE carro SET ano = '1980'
	WHERE id = 1003;
    
UPDATE carro SET ano = '2020'
	WHERE id = 1004;
    
UPDATE carro SET ano = '2014'
	WHERE id = 1005;
    
UPDATE carro SET ano = '2025'
	WHERE id = 1006;
    
SELECT * FROM carro;
