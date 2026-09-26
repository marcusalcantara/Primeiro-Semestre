-- Isso é um comentário 
/* 
Isso é um bloco de comentario
 */

-- Todo comando SQL é em inglês
-- Todo comando termina com ponto e virgula (;)

/*
Modelo de dados Relacional são tabelas que se relacionam 
entre elas. Tabelas contem linhas e colunas
e cada linha tem células com valores.
*/

-- SQL - Strutured Query Language

-- CRIAR O BANCO DE DADOS
CREATE DATABASE sprint1;

-- SELECIONAR O BANCO DE DADOS
USE sprint1;

-- CRIAR A TABELA CHAMADA ALUNO
CREATE TABLE aluno (
-- nomeDoCampo tipodoCampo
ra CHAR(8) PRIMARY KEY,   -- character
nome VARCHAR (20),
bairro VARCHAR (10),
faltas INT
);

-- INSERIR OS DADOS
INSERT INTO aluno VALUES
	('0126999' , 'Pedro' , 'Consolação', 1);
    
-- INSERINDO MAIS DE UMA LINHA 
INSERT INTO aluno VALUES
	('0126998','Vivian','Sacomã', 0),
	('0126997','Matheus', 'Sacomã', 3);
 
 -- EXIBIR OS DADOS
SELECT ra, nome, bairro, faltas FROM aluno;
SELECT * FROM aluno;

-- EXIBIR APENAS O NOME DO ALUNO
SELECT nome FROM aluno;

-- EXIBIR OS ALUNOS ONDE O BAIRRO É DIFERENTE SACOMÃ
SELECT nome FROM aluno
	WHERE bairro <> 'Sacomã';
 
-- EXIBIR OS ALUNOS COMEÇA COM A LETRA S
SELECT * FROM aluno
	WHERE bairro LIKE '%o';
    
-- EXIBIR OS ALUNOS ONDE O BAIRRO CONTÉM A LETRA A 
SELECT * FROM aluno
	WHERE bairro like '%a%' ORDER BY bairro;

-- EXIBIR EM ORDEM CRESCENTE    
SELECT * FROM aluno ORDER BY bairro;
SELECT * FROM aluno ORDER BY bairro ASC;

-- EXIBIR EM ORDEM DESCRECENTE
SELECT * FROM aluno ORDER BY bairro DESC;