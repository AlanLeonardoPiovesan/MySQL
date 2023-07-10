/* VIEWS */

CREATE VIEW RELATORIO AS
SELECT
	C.NOME,
	C.SEXO,
	C.EMAIL,
	T.TIPO,
	T.NUMERO,
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

/* A CRIAÇÃO DA VIEW DIMINUI TEMPO DE DIGITALIZAÇÃO*/
SELECT *
FROM RELATORIO;

SHOW TABLES;

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;

/* DICA - CRIE A VIEW COM UM INDICATIVO UNICO NO NOME */
CREATE VIEW V_RELATORIO AS
SELECT
	C.NOME,
	C.SEXO,
	IFNULL(C.EMAIL, 'CLIENTE SEM E-MAIL') AS 'E-MAIL',
	T.TIPO,
	T.NUMERO,
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT * FROM V_RELATORIO;

SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;