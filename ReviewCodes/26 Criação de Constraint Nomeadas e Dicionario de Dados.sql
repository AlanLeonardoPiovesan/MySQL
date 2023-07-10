/* ORGANIZAÇÃO DE CHAVES 
CRIAÇÃO DE CONSTRAINT NOMEADAS */

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);


-- SE DER PROBLEMA, DELETE AS TABELAS E CRIE NOVAMENTE
/* DICIONARIO DE DADOS  - DATABASES DO DICIONARIO
1. INFORMATION_SCHEMA
2. MYSQL
3. PERFORMANCE_SCHEMA */

USE INFORMATION_SCHEMA;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS 'BANCO',
	TABLE_NAME AS 'TABELA',
	CONSTRAINT_NAME AS 'NOME REGRA',
	CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/* APAGANDO CONSTRAINT */
USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;