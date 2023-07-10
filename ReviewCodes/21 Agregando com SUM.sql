/* Mais funções do MY SQL */
/* AGREGANDO COM SUM - SOMANDO OS VALORES */

SELECT 
	SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

SELECT 
	SUM(JANEIRO) AS TOTAL_JAN,
	SUM(FEVEREIRO) AS TOTAL_FEV,
	SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

/* VENDAS POR SEXO */
SELECT SEXO,
	SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;
+------+-------------+
| SEXO | TOTAL_MARCO |
+------+-------------+
| F    |   331168.91 |
| M    |   310168.91 |
+------+-------------+

SELECT SEXO,
	SUM(JANEIRO) AS TOTAL_JAN,
	SUM(FEVEREIRO) AS TOTAL_FEV,
	SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;