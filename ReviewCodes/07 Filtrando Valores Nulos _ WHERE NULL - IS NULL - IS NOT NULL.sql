USE PROJETO;

SELECT * 
FROM CLIENTE
WHERE CPF IS NULL;

SELECT * 
FROM CLIENTE
WHERE CPF IS NOT NULL;