/* PROCEDURES COM QUERY */
DELIMITER $

CREATE DATABASE PROJETO$

USE PROJETO$

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
)$

INSERT INTO CURSOS VALUES(NULL, 'JAVA', 30, 500.00);
INSERT INTO CURSOS VALUES(NULL, 'FUNDAMENTOS DE BANCO DE DADOS', 40, 700.00)$

SELECT *
FROM CURSOS$

DELIMITER #
STATUS
CREATE PROCEDURE
	CAD_CURSO(
		P_NOME VARCHAR(30),
		P_HORAS INT(30),
		P_VALOR FLOAT(10,2)
		)
BEGIN
	INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_VALOR);
END #

DELIMITER ;
STATUS

CALL CAD_CURSO('BI SQL SERVER', 35, 3000.00);
CALL CAD_CURSO('POWER BI', 20, 1000.00);
CALL CAD_CURSO('TABLEAU', 30, 1200.00);

SELECT *
FROM CURSOS;
+---------+-------------------------------+-------+---------+
| IDCURSO | NOME                          | HORAS | VALOR   |
+---------+-------------------------------+-------+---------+
|       1 | JAVA                          |    30 |  500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|       3 | BI SQL SERVER                 |    35 | 3000.00 |
|       4 | POWER BI                      |    20 | 1000.00 |
|       5 | TABLEAU                       |    30 | 1200.00 |
+---------+-------------------------------+-------+---------+

/* CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS */

DELIMITER $
STATUS

CREATE PROCEDURE CONS_CURSOS()
BEGIN
	SELECT * FROM CURSOS;
END $

DELIMITER ;
STATUS

CALL CONS_CURSOS;