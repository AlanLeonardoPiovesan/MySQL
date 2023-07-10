/* Mais funções do MY SQL */
/* 	1. VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME 
	2. NOME E O VALOR DE QUEM VENDEU MAIS EM MARCO
	3. QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV
*/

+------------+----------+------+-----------+-----------+----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO    |
+------------+----------+------+-----------+-----------+----------+
|          1 | CARLOS   | M    |  76321.32 |  78543.23 | 98542.23 |
|          2 | MARIA    | F    |  32321.32 |  45543.23 | 99542.23 |
|          3 | ANTONIO  | M    |  76521.32 |  80543.23 | 85542.23 |
|          4 | CLARA    | F    |  12321.32 |  30543.23 | 40542.23 |
|          5 | ANDERSON | M    |  43321.32 |  45543.23 | 55542.23 |
|          6 | IVONE    | F    |  87321.32 |  90543.23 | 98542.23 |
|          7 | JOAO     | M    | 456321.31 |  67543.23 | 70542.23 |
|          8 | CELIA    | F    |  94321.32 |  88543.23 | 92542.23 |
+------------+----------+------+-----------+-----------+----------+
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDVENDEDOR | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME       | varchar(30) | YES  |     | NULL    |                |
| SEXO       | char(1)     | YES  |     | NULL    |                |
| JANEIRO    | float(10,2) | YES  |     | NULL    |                |
| FEVEREIRO  | float(10,2) | YES  |     | NULL    |                |
| MARCO      | float(10,2) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

SELECT NOME,
	SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY NOME
ORDER BY 2 ASC;
+----------+-------------+
| NOME     | TOTAL_MARCO |
+----------+-------------+
| CLARA    |    40542.23 |
| ANDERSON |    55542.23 |
| JOAO     |    70542.23 |
| ANTONIO  |    85542.23 |
| CELIA    |    92542.23 |
| CARLOS   |    98542.23 |
| IVONE    |    98542.23 |
| MARIA    |    99542.23 |
+----------+-------------+

SELECT NOME,
	SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY NOME
ORDER BY 2 DESC;
+----------+-------------+
| NOME     | TOTAL_MARCO |
+----------+-------------+
| MARIA    |    99542.23 |
| CARLOS   |    98542.23 |
| IVONE    |    98542.23 |
| CELIA    |    92542.23 |
| ANTONIO  |    85542.23 |
| JOAO     |    70542.23 |
| ANDERSON |    55542.23 |
| CLARA    |    40542.23 |
+----------+-------------+

_____________
1. VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME 
SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);
+-------+----------+
| NOME  | MARCO    |
+-------+----------+
| CLARA | 40542.23 |
+-------+----------+

______________
2. NOME E O VALOR DE QUEM VENDEU MAIS EM MARCO
SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);
+-------+----------+
| NOME  | MARCO    |
+-------+----------+
| MARIA | 99542.23 |
+-------+----------+

______________
/* 3. QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV */
SELECT
	AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;
+--------------+
| MEDIA_FEV    |
+--------------+
| 65918.228027 |
+--------------+

SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES)
ORDER BY 2 DESC;
+---------+----------+
| NOME    | MARCO    |
+---------+----------+
| MARIA   | 99542.23 |
| CARLOS  | 98542.23 |
| IVONE   | 98542.23 |
| CELIA   | 92542.23 |
| ANTONIO | 85542.23 |
| JOAO    | 70542.23 |
+---------+----------+

SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO < (SELECT AVG(FEVEREIRO) FROM VENDEDORES)
ORDER BY 2 DESC;
+----------+----------+
| NOME     | MARCO    |
+----------+----------+
| ANDERSON | 55542.23 |
| CLARA    | 40542.23 |
+----------+----------+