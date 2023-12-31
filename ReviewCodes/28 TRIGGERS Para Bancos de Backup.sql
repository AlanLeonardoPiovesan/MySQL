/* TRIGGERS PARA BANCOS DE BACKUP */

/* COMUNICAÇÃO ENTRE BANCOS */

CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTOS(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

CREATE DATABASE BACKUP;
USE BACKUP;

CREATE TABLE BKP_PRODUTOS(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA;

INSERT INTO BACKUP.BKP_PRODUTOS VALUES(NULL, 1000, 'TESTE', 0.00);

SELECT *
FROM BACKUP.BKP_PRODUTOS;

_____________
/* TRIGGER COM INSERT */
DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTOS
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTOS VALUES(NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);
END$

DELIMITER ;

INSERT INTO PRODUTOS VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTOS VALUES(NULL, 'LIVRO BI', 80.00);
INSERT INTO PRODUTOS VALUES(NULL, 'LIVRO ORACLE', 70.00);
INSERT INTO PRODUTOS VALUES(NULL, 'LIVRO SQL SERVER', 100.00);
INSERT INTO PRODUTOS VALUES(NULL, 'LIVRO C#', 110.00);

SELECT *
FROM PRODUTOS;

SELECT *
FROM BACKUP.BKP_PRODUTOS;
____________

/* TRIGGER COM DELETE */
DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTOS
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTOS VALUES(NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR);
END$

DELIMITER ;

DELETE FROM PRODUTOS WHERE IDPRODUTO = 2;

SELECT *
FROM BACKUP.BKP_PRODUTOS;
______________________

/* EXCLUINDO TRIGGER */
DROP TRIGGER nome_tabela;
______________________

/* ADICIONANDO EVENTO A TABELA PARA IDENTIFICAR QUANDO GEROU A TRIGGER */
ALTER TABLE BACKUP.BKP_PRODUTOS
ADD EVENTO CHAR(1);

SELECT *
FROM BACKUP.BKP_PRODUTOS;

DROP TRIGGER BACKUP_PRODUTO_DELETE

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTOS
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTOS VALUES(NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR, 'D');
END$

DELIMITER ;