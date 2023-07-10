/* AUTO RELACIONAMENTO */
CREATE DATABASE AULA30;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

ALTER TABLE CURSOS
ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ)
	REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES(NULL, 'BD RELACIONAL', 20, 400.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'BUSINESS INTELLIGENCE', 40, 800.00, 1);
INSERT INTO CURSOS VALUES(NULL, 'RELATORIO AVANCADOS', 20, 600.00, 2);
INSERT INTO CURSOS VALUES(NULL, 'LOGICA DE PROGRAMACAO', 20, 400.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'RUBY', 30, 500.00, 4);

SELECT *
FROM CURSOS;

SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ, 'SEM REQ') REQUISITO
FROM CURSOS;

/* NOME, VALOR, HORAS E O NOME DO PRE REQUISITO */
SELECT C.NOME AS CURSO, C.VALOR AS VALOR, C.HORAS AS CARGA, IFNULL(P.NOME, '*NAO TEM REQUISITO') REQUISITO
FROM CURSOS C
LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;