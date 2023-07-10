/* IF NULL */

/* NOME, EMAIL, NUMERO, ESTADO */
SELECT
	C.NOME,
	C.EMAIL,
	T.NUMERO,
	E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+---------------+-------------------+-----------+--------+
| NOME          | EMAIL             | NUMERO    | ESTADO |
+---------------+-------------------+-----------+--------+
| ALAN LEONARDO | ALAN@GMAIL.COM    | 998065041 | PR     |
| ALAN LEONARDO | ALAN@GMAIL.COM    | 32293734  | PR     |
| JOAO          | JOAO@GMAIL.COM    | 998035012 | SP     |
| CARLOS        | CARLOS@GMAIL.COM  | 998023042 | SP     |
| MARIA         | MARIA@GMAIL.COM   | 998015532 | RJ     |
| CELIA         | NULL              | 999013261 | RS     |
| PAULA         | NULL              | 88093212  | RJ     |
| FLAVIO        | FLAVIO@IG.COM     | 68976565  | MG     |
| FLAVIO        | FLAVIO@IG.COM     | 99656675  | MG     |
| GIOVANA       | NULL              | 33567765  | RJ     |
| GIOVANA       | NULL              | 88668786  | RJ     |
| GIOVANA       | NULL              | 55689654  | RJ     |
| KARLA         | KARLA@GMAIL.COM   | 88687979  | RJ     |
| DANIELE       | DANIELE@GMAIL.COM | 88965676  | ES     |
| EDUARDO       | NULL              | 89966809  | PR     |
| ANTONIO       | ANTONIO@IG.COM    | 88679978  | SP     |
| ANTONIO       | ANTONIO@UOL.COM   | 99655768  | PR     |
| ELAINE        | ELAINE@GLOBO.COM  | 89955665  | SP     |
| CARMEM        | CARMEM@IG.COM     | 77455786  | RJ     |
| CARMEM        | CARMEM@IG.COM     | 89766554  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM | 77755785  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM | 44522578  | RJ     |
+---------------+-------------------+-----------+--------+

SELECT
	C.NOME,
	IFNULL(C.EMAIL, 'NÃO TEM EMAIL'),
	T.NUMERO,
	E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+---------------+-----------------------------------+-----------+--------+
| NOME          | IFNULL(C.EMAIL, 'NÃO TEM EMAIL')  | NUMERO    | ESTADO |
+---------------+-----------------------------------+-----------+--------+
| ALAN LEONARDO | ALAN@GMAIL.COM                    | 998065041 | PR     |
| ALAN LEONARDO | ALAN@GMAIL.COM                    | 32293734  | PR     |
| JOAO          | JOAO@GMAIL.COM                    | 998035012 | SP     |
| CARLOS        | CARLOS@GMAIL.COM                  | 998023042 | SP     |
| MARIA         | MARIA@GMAIL.COM                   | 998015532 | RJ     |
| CELIA         | NÃO TEM EMAIL                     | 999013261 | RS     |
| PAULA         | NÃO TEM EMAIL                     | 88093212  | RJ     |
| FLAVIO        | FLAVIO@IG.COM                     | 68976565  | MG     |
| FLAVIO        | FLAVIO@IG.COM                     | 99656675  | MG     |
| GIOVANA       | NÃO TEM EMAIL                     | 33567765  | RJ     |
| GIOVANA       | NÃO TEM EMAIL                     | 88668786  | RJ     |
| GIOVANA       | NÃO TEM EMAIL                     | 55689654  | RJ     |
| KARLA         | KARLA@GMAIL.COM                   | 88687979  | RJ     |
| DANIELE       | DANIELE@GMAIL.COM                 | 88965676  | ES     |
| EDUARDO       | NÃO TEM EMAIL                     | 89966809  | PR     |
| ANTONIO       | ANTONIO@IG.COM                    | 88679978  | SP     |
| ANTONIO       | ANTONIO@UOL.COM                   | 99655768  | PR     |
| ELAINE        | ELAINE@GLOBO.COM                  | 89955665  | SP     |
| CARMEM        | CARMEM@IG.COM                     | 77455786  | RJ     |
| CARMEM        | CARMEM@IG.COM                     | 89766554  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM                 | 77755785  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM                 | 44522578  | RJ     |
+---------------+-----------------------------------+-----------+--------+

SELECT
	C.NOME,
	IFNULL(C.EMAIL, 'NÃO TEM EMAIL') AS EMAIL,
	T.NUMERO,
	E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+---------------+-------------------+-----------+--------+
| NOME          | EMAIL             | NUMERO    | ESTADO |
+---------------+-------------------+-----------+--------+
| ALAN LEONARDO | ALAN@GMAIL.COM    | 998065041 | PR     |
| ALAN LEONARDO | ALAN@GMAIL.COM    | 32293734  | PR     |
| JOAO          | JOAO@GMAIL.COM    | 998035012 | SP     |
| CARLOS        | CARLOS@GMAIL.COM  | 998023042 | SP     |
| MARIA         | MARIA@GMAIL.COM   | 998015532 | RJ     |
| CELIA         | NÃO TEM EMAIL     | 999013261 | RS     |
| PAULA         | NÃO TEM EMAIL     | 88093212  | RJ     |
| FLAVIO        | FLAVIO@IG.COM     | 68976565  | MG     |
| FLAVIO        | FLAVIO@IG.COM     | 99656675  | MG     |
| GIOVANA       | NÃO TEM EMAIL     | 33567765  | RJ     |
| GIOVANA       | NÃO TEM EMAIL     | 88668786  | RJ     |
| GIOVANA       | NÃO TEM EMAIL     | 55689654  | RJ     |
| KARLA         | KARLA@GMAIL.COM   | 88687979  | RJ     |
| DANIELE       | DANIELE@GMAIL.COM | 88965676  | ES     |
| EDUARDO       | NÃO TEM EMAIL     | 89966809  | PR     |
| ANTONIO       | ANTONIO@IG.COM    | 88679978  | SP     |
| ANTONIO       | ANTONIO@UOL.COM   | 99655768  | PR     |
| ELAINE        | ELAINE@GLOBO.COM  | 89955665  | SP     |
| CARMEM        | CARMEM@IG.COM     | 77455786  | RJ     |
| CARMEM        | CARMEM@IG.COM     | 89766554  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM | 77755785  | RJ     |
| ADRIANA       | ADRIANA@GMAIL.COM | 44522578  | RJ     |
+---------------+-------------------+-----------+--------+