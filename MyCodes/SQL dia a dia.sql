--SQL dia a dia

/*CONSULTA DE LOTES JUNTO A DESCRIÇÃO DO PRODUTO */

SELECT produtos.Pro_Descricao, loteproduto.* 
FROM loteproduto
JOIN produtos
ON loteproduto.Pro_Codigo = produtos.Pro_Codigo
WHERE loteproduto.Lote_Validade < 'DATA FILTRO DE VALIDADE AQUI, FORMATO: '2023-05-18'';

SELECT *
FROM os_notavenda
ORDER BY 4;

SELECT *
FROM ordemserv_situacao
ORDER BY 2;

SELECT Ord_Numero, OrdS_Situacao
FROM ordemserv_situacao;

SELECT ordemserv_situacao.OrdS_Situacao, os_notavenda.*
FROM ordemserv_situacao
JOIN os_notavenda
ON ordemserv_situacao.Ord_Numero = os_notavenda.Ord_Numero;

SELECT ordemserv_situacao.OrdS_Situacao, os_notavenda.*
FROM ordemserv_situacao
JOIN os_notavenda
ON ordemserv_situacao.Ord_Numero = os_notavenda.Ord_Numero
WHERE OrdS_Situacao = 'F'
ORDER BY 4;

SELECT ordemserv_situacao.OrdS_Situacao, os_notavenda.*
FROM ordemserv_situacao
JOIN os_notavenda
ON ordemserv_situacao.Ord_Numero = os_notavenda.Ord_Numero
WHERE OrdS_Situacao = 'A'
ORDER BY 4;

SELECT ordemserv_situacao.OrdS_Situacao, os_notavenda.*
FROM ordemserv_situacao
JOIN os_notavenda
ON ordemserv_situacao.Ord_Numero = os_notavenda.Ord_Numero
WHERE NF_Numero = 2837;

SELECT *
FROM notasvenda
WHERE nf_numero = 117349;

------------SELECTS PARA COPIAR SCRIPTS------------------
SELECT * FROM SCRIPT WHERE SCR_ARQUIVO = 'NOME DO SCRIPT'.srs

SELECT * FROM SCRIPT WHERE SCR_ARQUIVO = 'NFVenda_Afterpost.srs';
