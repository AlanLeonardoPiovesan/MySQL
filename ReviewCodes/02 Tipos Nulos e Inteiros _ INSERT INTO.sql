USE PROJETO;

SHOW TABLES;

DESC CLIENTE;

/* ALTERANDO O TIPO DE DADO DA COLUNA DA TABELA */
ALTER TABLE CLIENTE MODIFY COLUMN CPF VARCHAR(11); 

/* SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA */

/* FORMA 01 - OMITINDO AS COLUNAS (DEVE SER A MESMA ORDEM DOS CAMPOS DA TABELA) NOME, SEXO, EMAIL, CPF, TELEFONE, ENDEREÇO*/
INSERT INTO CLIENTE VALUES ('CIDA', 'F', 'CIDA@GMAIL.COM', 98052128900, '32293734', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR');

INSERT INTO CLIENTE VALUES ('ALAN', 'M', 'ALAN@GMAIL.COM', 09766738947, '45998065041', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR');

INSERT INTO CLIENTE VALUES ('ALISSON', 'M', 'ALISSON@GMAIL.COM', NULL, NULL, 'RUA TOLEDO - PERIOLO - CASCAVEL - PR');

/* FORMA 02 - INDICANDO A ORDEM DAS COLUNAS */
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF, EMAIL) VALUES('ALAN', 'M', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR',  '45998065041', 097667389, 'ALAN@GMAIL.COM');

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF, EMAIL) VALUES('ALISSON', 'M', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR',  NULL, NULL, 'ALISSON@GMAIL.COM');


/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL*/
INSERT INTO CLIENTE VALUES('CIDA', 'F', 'CIDA@GMAIL.COM', 980521289, '32293734', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR'), ('ALAN', 'M', 'ALAN@GMAIL.COM', 097667389, '45998065041', 'RUA TOLEDO - PERIOLO - CASCAVEL - PR');