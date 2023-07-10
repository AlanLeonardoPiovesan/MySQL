------------SELECTS PARA CONSULTAR NOME DAS COLUNAS DAS TABELAS ------------------
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'tablenamehere'
OR TABLE_SCHEMA = 'datasetnamehere';

------------SELECTS PARA CONSULTA DE PRODUTOS COM GRADE ------------------
--Selects primários para descoberta dos campos nas tabelas
SELECT *
FROM estoque_grade;

GLin_Codigo
Pro_Codigo
Gra_Codigo

___________________
SELECT *
FROM grlinha;

GLin_Codigo
grlinha.Glin_Descricao

___________________
SELECT *
FROM produtos;

Pro_Descricao
Pro_Codigo

___________________
SELECT *
FROM grade;

Gra_Descricao
Gra_Codigo

___________________
SELECT *
FROM grupos;

Gru_Codigo
Gru_Descricao

___________________
SELECT *
FROM subgrupos;

SbGr_Codigo
SbGr_Descricao

___________________
SELECT *
FROM tabprecoitem;

Pro_Codigo
TPrc_Codigo
TPrcItm_Valor
___________________
SELECT *
FROM tabelaspreco;

TPrc_Codigo
TPrc_Descricao

___________________
--Selects com Join para junção de informações
SELECT produtos.Pro_Descricao, estoque_grade.*
FROM estoque_grade
JOIN produtos
ON estoque_grade.Pro_Codigo = produtos.Pro_Codigo;

SELECT grlinha.Glin_Descricao, estoque_grade.*
FROM estoque_grade
JOIN grlinha
ON estoque_grade.GLin_Codigo = grlinha.GLin_Codigo;

SELECT grade.Gra_Descricao, estoque_grade.*
FROM estoque_grade
JOIN grade
ON estoque_grade.Gra_Codigo = grade.Gra_Codigo;

SELECT grupos.Gru_Descricao, produtos.*
FROM produtos
JOIN grupos
ON produtos.Gru_Codigo = grupos.Gru_Codigo;

SELECT tabprecoitem.TPrcItm_Valor AS ValorProduto, estoque_grade.*
FROM estoque_grade
JOIN tabprecoitem
ON estoque_grade.Pro_Codigo = tabprecoitem.Pro_Codigo;

SELECT tabprecoitem.TPrc_Codigo AS CódigoTabela, tabprecoitem.TPrcItm_Valor AS ValorProduto, estoque_grade.Pro_Codigo
	FROM estoque_grade
JOIN tabprecoitem
	ON estoque_grade.Pro_Codigo = tabprecoitem.Pro_Codigo;

SELECT tabprecoitem.TPrc_Codigo AS CódigoTabela, tabelaspreco.TPrc_Descricao AS DescriçãoTabela, tabprecoitem.TPrcItm_Valor AS ValorProduto, estoque_grade.Pro_Codigo
	FROM estoque_grade
JOIN tabprecoitem
	ON estoque_grade.Pro_Codigo = tabprecoitem.Pro_Codigo
JOIN tabelaspreco
	ON tabelaspreco.TPrc_Codigo = tabprecoitem.TPrc_Codigo;
___________________ 
/*AQUI TEVE-SE UM PROBLEMA, AO DAR SELECT EM SUBGRUPOS, ELE GERA VÁRIOS REGISTROS REPETIDOS MAS QUE NA VERDADE SÃO DIFERENTES DEVIDO AO GRUPO SER DIFERENTE*/
SELECT subgrupos.SbGr_Descricao, produtos.*
FROM produtos
JOIN subgrupos
ON produtos.SbGr_Codigo = subgrupos.SbGr_Codigo;
___________________
--FINAL CODE - consulta para apresentação de informações dos produtos em grades
SELECT
	estoque_grade.Pro_Codigo AS Código,
	produtos.Pro_Descricao AS Descrição,
	grade.Gra_Descricao AS GradeDescrição,
	grupos.Gru_Descricao AS Grupo,
	subgrupos.SbGr_Descricao AS SubGrupo,
	grlinha.Glin_Descricao AS Grade,
	estoque_grade.EstG_Qtde AS QtdGrade,
	tabprecoitem.TPrc_Codigo AS CódigoTabela,
	tabelaspreco.TPrc_Descricao AS DescriçãoTabela,
	tabprecoitem.TPrcItm_Valor AS ValorProduto
FROM estoque_grade
JOIN grlinha
	ON estoque_grade.GLin_Codigo = grlinha.GLin_Codigo
JOIN produtos
	ON estoque_grade.Pro_Codigo = produtos.Pro_Codigo
JOIN grade
	ON estoque_grade.Gra_Codigo = grade.Gra_Codigo
JOIN grupos
	ON produtos.Gru_Codigo = grupos.Gru_Codigo
JOIN(
	SELECT DISTINCT SbGr_Codigo, Gru_Codigo, SbGr_Descricao 
		FROM subgrupos) AS subgrupos 
	ON produtos.SbGr_Codigo = subgrupos.SbGr_Codigo 
		AND produtos.Gru_Codigo = subgrupos.Gru_Codigo
JOIN tabprecoitem
	ON estoque_grade.Pro_Codigo = tabprecoitem.Pro_Codigo
JOIN tabelaspreco
	ON tabelaspreco.TPrc_Codigo = tabprecoitem.TPrc_Codigo;

 Código  Descrição                     GradeDescrição  Grupo        SubGrupo  Grade   QtdGrade  CódigoTabela  DescriçãoTabela  ValorProduto  
--------  ------------------------------  ----------------  -----------  --------  ------  --------  -------------  -----------------  --------------
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    P              3              1  TABELA PADRÃO                1200
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    M              3              1  TABELA PADRÃO                1200
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    G              3              1  TABELA PADRÃO                1200
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   30             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   31             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   32             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   33             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   34             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   35             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   36             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   37             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   38             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   39             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   40             2              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   41             2              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   42             2              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   43             2              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   44             1              1  TABELA PADRÃO               15000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   45             1              1  TABELA PADRÃO               15000
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    P              3              2  REVENDA                      2000
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    M              3              2  REVENDA                      2000
12200023  JERSEY MIAMI HEAT CITY EDITION  CONFECÇÃO P-G     CONFECÇÃO    JERSEY    G              3              2  REVENDA                      2000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   30             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   31             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   32             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   33             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   34             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   35             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   36             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   37             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   38             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   39             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   40             2              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   41             2              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   42             2              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   43             2              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   44             1              2  REVENDA                     25000
12200024  SNEAKER NIKE X TRAVIS SCOTT     CALÇADOS 30-45    CALÇADOS     SNEAKER   45             1              2  REVENDA                     25000