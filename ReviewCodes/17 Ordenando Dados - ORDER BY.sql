/* ORDER BY */

USE COMERCIO;
SHOW TABLES;

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE');

SELECT *
FROM ALUNOS
ORDER BY NUMERO;

SELECT *
FROM ALUNOS
ORDER BY 1;

/* OU */

SELECT *
FROM ALUNOS
ORDER BY NOME;

SELECT *
FROM ALUNOS
ORDER BY 2;

/* ORDENANDO POR MAIS DE UMA COLUNA */
SELECT *
FROM ALUNOS
ORDER BY NUMERO, NOME;

SELECT *
FROM ALUNOS
ORDER BY 1, 2;

/* MESCLANDO ORDER BY COM PROJEÇÃO */
/* SEMPRE USAR O NOME DAS COLUNAS */

SELECT NOME
FROM ALUNOS
ORDER BY NUMERO, NOME;

/* ORDER BY DESC */
SELECT *
FROM ALUNOS
ORDER BY 1 ASC;

SELECT *
FROM ALUNOS
ORDER BY 1 DESC;

SELECT *
FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

/* ORDENANDO COM JOINS */
SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

SELECT *
FROM V_RELATORIO
ORDER BY 1;