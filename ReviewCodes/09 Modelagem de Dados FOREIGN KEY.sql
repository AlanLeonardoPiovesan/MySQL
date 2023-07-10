/* MODELAGEM DE DADOS */

/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

/* PRIMEIRA FORMA NORMAL */

/* 
1 - TODO CAMPO VETORIZADO SE TORNARA OUTRA TABELA
[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNARA OUTRA TABELA OU
QUANDO O CAMPO FOR DIVISIVEL
EXEMPLO DE DADOS MULTIVALORADOS:  RUA TOLEDO (RUA)- PERIOLO (BAIRRO) - CASCAVEL (CIDADE) - PR (ESTADO)

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO
ISSO E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY
*/

/* CARDINALIDADE */
/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

/* CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA CARDINALIDADE N */

CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES; --> OPCIONAL

DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL, 'ALAN LEONARDO', 'M', 'ALAN@GMAIL.COM', '09766738947');
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '01234538947');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@GMAIL.COM', '54324538947');
INSERT INTO CLIENTE VALUES(NULL, 'MARIA', 'F', 'MARIA@GMAIL.COM', '98124538947');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'F', NULL, '87324538947');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@GMAIL.COM', '32164538947');

+-----------+---------------+------+------------------+-------------+
| IDCLIENTE | NOME          | SEXO | EMAIL            | CPF         |
+-----------+---------------+------+------------------+-------------+
|         1 | ALAN LEONARDO | M    | ALAN@GMAIL.COM   | 09766738947 |
|         2 | JOAO          | M    | JOAO@GMAIL.COM   | 01234538947 |
|         3 | CARLOS        | M    | CARLOS@GMAIL.COM | 54324538947 |
|         4 | MARIA         | F    | MARIA@GMAIL.COM  | 98124538947 |
|         5 | CELIA         | F    | NULL             | 87324538947 |
|         6 | JORGE         | M    | JORGE@GMAIL.COM  | 32164538947 |
+-----------+---------------+------+------------------+-------------+

INSERT INTO ENDERECO VALUES(NULL, 'RUA TOLEDO', 'PERIOLO', 'CASCAVEL', 'PR',1 );
INSERT INTO ENDERECO VALUES(NULL, 'RUA DAS AMERICAS', 'CENTRO', 'SAO PAULO', 'SP',2 );
INSERT INTO ENDERECO VALUES(NULL, 'RUA AMERICO', 'VILA A', 'SANTOS', 'SP',3 );
INSERT INTO ENDERECO VALUES(NULL, 'RUA JORDANIA', 'LEBLON', 'RIO DE JANEIRO', 'RJ',4 );
INSERT INTO ENDERECO VALUES(NULL, 'RUA DAS TORRES', 'SANTA MARIA', 'CAMPO BOM', 'RS',5 );
INSERT INTO ENDERECO VALUES(NULL, 'AVENIDA BRASIL', 'CENTRO', 'SALVADOR', 'BA',6 );

+------------+------------------+-------------+----------------+--------+------------+
| IDENDERECO | RUA              | BAIRRO      | CIDADE         | ESTADO | ID_CLIENTE |
+------------+------------------+-------------+----------------+--------+------------+
|          1 | RUA TOLEDO       | PERIOLO     | CASCAVEL       | PR     |          1 |
|          2 | RUA DAS AMERICAS | CENTRO      | SAO PAULO      | SP     |          2 |
|          3 | RUA AMERICO      | VILA A      | SANTOS         | SP     |          3 |
|          4 | RUA JORDANIA     | LEBLON      | RIO DE JANEIRO | RJ     |          4 |
|          5 | RUA DAS TORRES   | SANTA MARIA | CAMPO BOM      | RS     |          5 |
|          6 | AVENIDA BRASIL   | CENTRO      | SALVADOR       | BA     |          6 |
+------------+------------------+-------------+----------------+--------+------------+

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '998065041', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '32293734', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '998035012', 2);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '998023042', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '998015532', 4);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '999013261', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '988061267', 6);

UPDATE TELEFONE
SET TIPO = 'RES'
WHERE IDTELEFONE = 2;

UPDATE TELEFONE
SET TIPO = 'COM'
WHERE IDTELEFONE = 4;

UPDATE TELEFONE
SET TIPO = 'COM'
WHERE IDTELEFONE = 6;

DELETE
FROM TELEFONE
WHERE IDTELEFONE = 7;