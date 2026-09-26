CREATE DATABASE sensor;

CREATE TABLE usuario(
nomeCompleto VARCHAR(100),
email VARCHAR(50),
tipoLogin VARCHAR(40) CONSTRAINT chkLogin CHECK (tipo IN('admin', 'comum'))
)