/* INTRODUÇÃO AOS CURSORES */

CREATE DATABASE CURSORES;
USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT
);

INSERT INTO VENDEDORES VALUES(NULL, 'MAFRA', 23431.00, 32431.00, 29431.00);
INSERT INTO VENDEDORES VALUES(NULL, 'ALAN', 12431.00, 31431.00, 25431.00);
INSERT INTO VENDEDORES VALUES(NULL, 'JOAO', 20421.00, 22431.00, 22431.00);
INSERT INTO VENDEDORES VALUES(NULL, 'ANTONIO', 40431.00, 41431.00, 45431.00);
INSERT INTO VENDEDORES VALUES(NULL, 'CAMILA', 25431.00, 28431.00, 10431.00);

SELECT *
FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL
FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR)/3 AS MEDIA
FROM VENDEDORES;

/* OUTRA ALTERNATIVA PARA REALIZAÇÃO DESSES CALCULOS */

CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);
	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
	OPEN REG;
	REPEAT
		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
			IF NOT FIM THEN
				SET VTOTAL = VAR1 + VAR2 + VAR3;
				SET VMEDIA = VTOTAL / 3;
				INSERT INTO VEND_TOTAL VALUES(VNOME, VAR1, VAR2, VAR3, VTOTAL, VMEDIA);
			END IF;
	UNTIL FIM END REPEAT;
	CLOSE REG;
END $

DELIMITER ;

SELECT *
FROM VENDEDORES;

SELECT *
FROM VEND_TOTAL;

CALL INSEREDADOS()