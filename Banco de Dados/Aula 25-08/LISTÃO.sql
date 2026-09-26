USE sprint1;

CREATE TABLE produto(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
categoria VARCHAR(50),
preco DECIMAL(10,2),
tamanho VARCHAR(5),
CONSTRAINT chkTamanho CHECK(tamanho IN ('P' , 'M', 'G', 'GG')),
data_cadastro DATETIME,
disponivel TINYINT,
CONSTRAINT chkDisponivel CHECK (disponivel IN (0,1))
);

INSERT INTO produto (nome, categoria, preco, tamanho, data_cadastro, disponivel) VALUES
('Nike Tech', 'Conjunto', '333.55', 'M', '2026-05-09', 1),
('Macacão Nike', 'Macacão', '200.99', 'G', '2022-10-28', 0),
('Jacket Mizuno', 'Jaqueta', '199.99', 'GG', '2023-12-08', 0),
('Puma de Praia', 'Bermudão', '99.99', 'P', '2025-05-09', 1),
('Bermuda Adidas', 'Bermuda', '333.55', 'M', '2024-01-12', 1),
('Flamengo', 'Camiseta', '10000.55', 'P', '2026-09-12', 0);

SELECT * FROM produto;

TRUNCATE TABLE produto;

SELECT nome FROM produto
	WHERE nome LIKE 'Camiseta';
    
SELECT * FROM produto
	WHERE tamanho <> 'M';
    
SELECT * FROM produto
	WHERE data_cadastro > '2025-08-18';
    
SELECT * FROM produto
	WHERE disponivel = 1 AND categoria IN ('Camiseta', 'Blusa');
    
SELECT concat(nome,' ',preco) AS produto_preco FROM produto;

SELECT * FROM produto
	WHERE nome NOT LIKE 'Blusa';
    
SELECT id, nome, categoria, preco, tamanho, data_cadastro, disponivel,
	CASE 
    WHEN disponivel = 1 THEN 'Disponivel'
    ELSE 'Indisponivel' END AS Statuss FROM produto ;
    
SELECT * FROM produto
	WHERE categoria LIKE 'Calça' AND preco > 100;
 
SELECT * FROM produto 
	WHERE nome NOT LIKE '%Camiseta%';
    
SELECT * FROM produto
	WHERE id = 1 OR id = 3 OR id = 5;

SELECT * FROM produto
	WHERE tamanho <> 'P' AND tamanho <> 'M';

SELECT * FROM produto
	WHERE data_cadastro < '2025-08-18';
    
SELECT CONCAT(nome,' ',preco) AS produto_valor FROM produto ;   

SELECT id, nome, categoria, preco, tamanho, data_cadastro, disponivel,
	CONCAT(nome, ' ' , categoria, ' ' , preco) AS info_completa FROM produto;

DESCRIBE produto;

SELECT * FROM produto
	WHERE disponivel > 0 AND tamanho LIKE 'M';
    
SELECT * FROM produto
	WHERE nome LIKE 'C%';
    
UPDATE produto SET preco = '270.00'
	WHERE ID = 3;

SELECT * FROM produto;

UPDATE produto SET disponivel = '0'
	WHERE categoria = 'Blusa';
    
UPDATE produto SET tamanho = 'M'
	WHERE categoria = 'Short';
    
UPDATE produto SET categoria = 'Camiseta'
	WHERE nome LIKE 'Camiseta';
    
UPDATE produto SET disponivel = '1'
	WHERE id = 6 or id = 1 or id = 4;

DESCRIBE produto;
SELECT * FROM produto;

UPDATE produto SET preco = 
	CASE	
	WHEN preco < 100 THEN preco * 1.05
	ELSE preco >= 100 END;
    
UPDATE produto SET nome = 'Short Esportivo Unissex'
	WHERE id = 4;
    
UPDATE produto SET disponivel = 0
	WHERE nome LIKE 'Blusa' or nome LIKE 'Moletom';
    
UPDATE produto SET data_cadastro = now()
	WHERE id = 6;
    
INSERT INTO produto (nome, categoria, preco, tamanho, data_cadastro, disponivel) VALUES
	('Jaqueta balão' , 'Jaqueta' , 299.00, 'G', now(), 1),
	('Short de praia' , 'Short' , 99.00, 'P', now(), 0),
	('Blusa Nike' , 'Blusa' , 199.00, 'M', now(), 0),
	('Camisa da Loud' , 'Camisa' , 499.00, 'G', now(), 1),
	('Short de vôlei' , 'Short' , 399.00, 'P', now(), 0),
	('Bermudão de cria' , 'Bermuda' , 599.00, 'M', now(), 1);

SELECT * FROM produto;

SELECT * FROM produto
	WHERE categoria = 'Jaqueta' AND disponivel = 0;
    
SELECT * FROM produto 
	WHERE tamanho = 'GG' OR tamanho = 'P' ORDER BY preco DESC;
    
SELECT nome, tamanho FROM produto
	WHERE mouth (data_cadastro) = 08 AND year (data_cadastro) = 2025;
    
SELECT * FROM produto 
	WHERE nome LIKE '%a';
    
SELECT * FROM produto 
	WHERE categoria <> 'Camiseta' AND categoria <> 'Calça' AND categoria <> 'Short';
    
SELECT concat(nome,' ', categoria,' ', preco, ' ', tamanho,' ', data_cadastro,' ', dispovivel)
	AS Nome_Preco FROM produto 
	WHERE preco >= 50.00 AND preco < 150.00;
    
SELECT id, nome, categoria, preco, tamanho, data_cadastro, disponivel,
	CONCAT(nome,'-', categoria, ' ') AS info FROM produto;
    
DESCRIBE produto;
