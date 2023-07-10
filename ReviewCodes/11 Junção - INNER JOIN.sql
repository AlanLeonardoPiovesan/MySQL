/* JUNÇÃO --> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+---------------+------------------+-----------+
| NOME          | EMAIL            | IDCLIENTE |
+---------------+------------------+-----------+
| ALAN LEONARDO | ALAN@GMAIL.COM   |         1 |
| JOAO          | JOAO@GMAIL.COM   |         2 |
| CARLOS        | CARLOS@GMAIL.COM |         3 |
| MARIA         | MARIA@GMAIL.COM  |         4 |
| CELIA         | NULL             |         5 |
| JORGE         | JORGE@GMAIL.COM  |         6 |
+---------------+------------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+------------+-------------+----------------+
| ID_CLIENTE | BAIRRO      | CIDADE         |
+------------+-------------+----------------+
|          1 | PERIOLO     | CASCAVEL       |
|          2 | CENTRO      | SAO PAULO      |
|          3 | VILA A      | SANTOS         |
|          4 | LEBLON      | RIO DE JANEIRO |
|          5 | SANTA MARIA | CAMPO BOM      |
|          6 | CENTRO      | SALVADOR       |
+------------+-------------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE 
AND SEXO = 'F';
/* EVITAR USAR WHERE QUANDO FOR FAZER JUNÇÃO, POIS COM WHERE É UMA CLAUSULA DE SELEÇÃO
E QUE VALIDA A REGRA DE TABELA VERDADE */

+---------------+------+-------------+----------------+
| NOME          | SEXO | BAIRRO      | CIDADE         |
+---------------+------+-------------+----------------+
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       |
| JOAO          | M    | CENTRO      | SAO PAULO      |
| CARLOS        | M    | VILA A      | SANTOS         |
| MARIA         | F    | LEBLON      | RIO DE JANEIRO |
| CELIA         | F    | SANTA MARIA | CAMPO BOM      |
| JORGE         | M    | CENTRO      | SALVADOR       |
+---------------+------+-------------+----------------+

/* SEMPRE REALIZAR A JUNÇÃO DE ACORDO COM O EXEMPLO ABAIXO */
SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
INNER JOIN ENDERECO /* JUNÇÃO */
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELEÇÃO */

+---------------+------+-------------+----------------+
| NOME          | SEXO | BAIRRO      | CIDADE         |
+---------------+------+-------------+----------------+
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       |
| JOAO          | M    | CENTRO      | SAO PAULO      |
| CARLOS        | M    | VILA A      | SANTOS         |
| MARIA         | F    | LEBLON      | RIO DE JANEIRO |
| CELIA         | F    | SANTA MARIA | CAMPO BOM      |
| JORGE         | M    | CENTRO      | SALVADOR       |
+---------------+------+-------------+----------------+

+-------+------+-------------+----------------+
| NOME  | SEXO | BAIRRO      | CIDADE         |
+-------+------+-------------+----------------+
| MARIA | F    | LEBLON      | RIO DE JANEIRO |
| CELIA | F    | SANTA MARIA | CAMPO BOM      |
+-------+------+-------------+----------------+

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

+---------------+------+------------------+------+-----------+
| NOME          | SEXO | EMAIL            | TIPO | NUMERO    |
+---------------+------+------------------+------+-----------+
| ALAN LEONARDO | M    | ALAN@GMAIL.COM   | CEL  | 998065041 |
| ALAN LEONARDO | M    | ALAN@GMAIL.COM   | RES  | 32293734  |
| JOAO          | M    | JOAO@GMAIL.COM   | CEL  | 998035012 |
| CARLOS        | M    | CARLOS@GMAIL.COM | COM  | 998023042 |
| MARIA         | F    | MARIA@GMAIL.COM  | CEL  | 998015532 |
| CELIA         | F    | NULL             | COM  | 999013261 |
+---------------+------+------------------+------+-----------+

/* EXEMPLOS ACIMA SÃO COM JUNÇÕES DE DUAS TABELAS */

/* JUNÇÃO COM MAIS DE DUAS TABELAS */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE 
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------------+------+-------------+----------------+------+-----------+
| NOME          | SEXO | BAIRRO      | CIDADE         | TIPO | NUMERO    |
+---------------+------+-------------+----------------+------+-----------+
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       | CEL  | 998065041 |
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       | RES  | 32293734  |
| JOAO          | M    | CENTRO      | SAO PAULO      | CEL  | 998035012 |
| CARLOS        | M    | VILA A      | SANTOS         | COM  | 998023042 |
| MARIA         | F    | LEBLON      | RIO DE JANEIRO | CEL  | 998015532 |
| CELIA         | F    | SANTA MARIA | CAMPO BOM      | COM  | 999013261 |
+---------------+------+-------------+----------------+------+-----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE 
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------------+------+-------------+----------------+------+-----------+
| NOME          | SEXO | BAIRRO      | CIDADE         | TIPO | NUMERO    |
+---------------+------+-------------+----------------+------+-----------+
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       | CEL  | 998065041 |
| ALAN LEONARDO | M    | PERIOLO     | CASCAVEL       | RES  | 32293734  |
| JOAO          | M    | CENTRO      | SAO PAULO      | CEL  | 998035012 |
| CARLOS        | M    | VILA A      | SANTOS         | COM  | 998023042 |
| MARIA         | F    | LEBLON      | RIO DE JANEIRO | CEL  | 998015532 |
| CELIA         | F    | SANTA MARIA | CAMPO BOM      | COM  | 999013261 |
+---------------+------+-------------+----------------+------+-----------+

/* PODE SER FEITO DAS DUAS FORMAS */