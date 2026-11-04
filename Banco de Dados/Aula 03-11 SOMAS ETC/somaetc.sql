CREATE DATABASE sprint3;
USE sprint3;

CREATE TABLE curso(
idCurso INT primary KEY auto_increment,
nome VARCHAR(45),
tipo VARCHAR(45),
constraint chkTipo CHECK(tipo in('presencial', 'remoto')),
cargaHoraria INT
);

insert into curso (nome, tipo) VALUES
	('Inglês', 'Presencial'),
	('Espanhol', 'Presencial');
    
SELECT * FROM curso;

CREATE TABLE aluno(
idAluno INT primary KEY auto_increment,
nome VARCHAR(45),
email VARCHAR(45)
) auto_increment = 1000;

INSERT INTO aluno (nome) VALUES
	('Marcus'),
    ('Renan'),
    ('Idalina');
    
-- RELACIONAMENTO N:N CRIA-SE A TABELA ASSOCIATIVA
CREATE TABLE matricula(
idMatricula INT auto_increment,
fkCurso INT,
constraint fkCursoMatricula foreign key (fkCurso)
	references curso(idCurso),
fkAluno INT,
constraint fkAlunoMatricula foreign key (fkAluno)
	references aluno(idAluno),
constraint pkComposta primary key (idMatricula, fkCurso, fkAluno),
nota DECIMAL(4,2)
);

INSERT INTO matricula VALUES
	(default, 1, 1000, 6),
	(default, 2, 1001, 5),
	(default, 2, 1001, 6);
    
select aluno.nome AS 'Nome Aluno', 
	curso.nome AS 'Nome Curso',
    nota,
    CASE
    WHEN nota >= 6 THEN 'Aprovado'
    ELSE 'Reprovado'
    END Statuss
    FROM aluno JOIN matricula
		ON fkAluno = idAluno
        JOIN curso
        ON fkCurso = idCurso;
        
-- FUNÇÕES MATEMATICAS
-- MAX()
SELECT MAX(nota) FROM matricula;

-- MIN()
SELECT MIN(nota) FROM matricula;

SELECT MIN(nota), MIN(nota) FROM matricula;

-- SUM()
SELECT SUM(nota) FROM matricula;

-- AVG()
SELECT AVG(nota) FROM matricula;

-- ROUND()
SELECT ROUND (AVG(nota),2), AVG(nota) FROM matricula;

-- TRUNCATE()
SELECT truncate (AVG(nota),2), AVG(nota) FROM matricula;

-- COUNT() conta apenas campos com valor, se nulo não conta
SELECT COUNT(nota) FROM matricula;
INSERT INTO matricula VALUES
	(default, 1, 1002, NULL);

SELECT * FROM matricula;

-- GROUP BT - FUNÇÃO DE AGREGAÇÃO

SELECT AVG(nota), curso.nome FROM curso join matricula
	ON idCurso = fkCurso
    group by curso.nome;
    
SELECT AVG(nota), aluno.nome FROM aluno join matricula
	ON idAluno = fkAluno
    group by aluno.nome;
    
INSERT INTO matricula VALUES
	(default, 2, 1002, 9);
    
-- EXIBIR O ALUNO QUE TEM A MAIOR NOTA
SELECT aluno.nome, nota FROM aluno join matricula
	ON idAluno = fkAluno
    WHERE nota = (SELECT MAX(nota) FROM matricula); 
-- WHERE nota = (SELECT MAX(nota) FROM matricula); ISSO É UMA SUBQUERRY

