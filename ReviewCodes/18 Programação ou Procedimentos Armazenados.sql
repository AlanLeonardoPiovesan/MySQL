/* STORED PROCEDURES */

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN
	QUALQUER PROGRAMACAO;
END
$
________________

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

/* CHAMANDO UMA PROCEDURE */
CALL NOME_EMPRESA()$

/* PROCEDURES COM PARAMETROS */
CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTA;
END
$

CALL CONTA(100,50)$
CALL CONTA(1232,5432)$
CALL CONTA(5423,15)$

/* APAGANDO UMA PROCEDURE */
DROP PROCEDURE CONTA$