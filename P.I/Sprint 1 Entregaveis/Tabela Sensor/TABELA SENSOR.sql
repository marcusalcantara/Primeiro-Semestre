CREATE DATABASE sensor;

USE sensor;
CREATE TABLE usuario(
idUsuario INT PRIMARY KEY auto_increment,
nomeCompleto VARCHAR(100),
email VARCHAR(50),
tipoLogin VARCHAR(40) CONSTRAINT chkLogin CHECK (tipoLogin IN('admin', 'usuario')),
dtCadastro DATE
); 

CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
nomeSensor VARCHAR(50),
tipo VARCHAR(50),
localizacao VARCHAR(100),
volume INT CONSTRAINT chkVolume CHECK (volume IN (20, 50, 70))
);

CREATE TABLE prefeitura(
idPrefeitura INT PRIMARY KEY auto_increment,
nomePrefeitura VARCHAR(50),
qtdCaminhoes INT,
qtdCacambas INT,
investimento DECIMAL(15,2)
);

ALTER TABLE prefeitura MODIFY COLUMN investimento DECIMAL(10,2); 

DESCRIBE prefeitura;

