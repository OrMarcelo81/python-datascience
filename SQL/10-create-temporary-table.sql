CREATE TEMPORARY TABLE new_tbl SELECT * FROM orig_tbl LIMIT 0;


CREATE TEMPORARY TABLE UCOM.ORLANDO
SELECT *
FROM UCOM.clientes
LIMIT 5 

SELECT *
FROM UCOM.ORLANDO

UPDATE UCOM.ORLANDO
SET edad = 50
WHERE documento = 113807



CREATE TEMPORARY TABLE UCOM.EJERCICIO
WITH FUNCIONARIOS AS (SELECT DISTINCT CODIGO_PERSONA
                      FROM UCOM.FUNCIONARIOS
                     ),
     VACUNADOS    AS (SELECT DISTINCT CEDULA
                      FROM UCOM.VACUNADOS
                     ),
     ANDE         AS (SELECT DISTINCT RUC
                      FROM UCOM.ANDE
                     )                                          
SELECT A.documento
, A.edad
, A.nivel_academico
, A.genero
, CASE WHEN B.CODIGO_PERSONA IS NULL THEN 0 
       ELSE 1 
       END AS ES_FUNCIONARIO
, CASE WHEN C.CEDULA IS NULL THEN 0 
       ELSE 1 
       END AS VACUNADO
, CASE WHEN D.RUC IS NULL THEN 0 
       ELSE 1 
       END AS TIENE_NIS
, E.faja
, E.mora_30            
FROM UCOM.clientes A
LEFT JOIN FUNCIONARIOS B ON B.CODIGO_PERSONA = LPAD(A.documento, 15, '0')
LEFT JOIN VACUNADOS C ON C.CEDULA = A.documento
LEFT JOIN ANDE D ON D.RUC = A.documento
LEFT JOIN UCOM.score_externo E ON E.documento = A.documento



SELECT *
FROM UCOM.EJERCICIO

SELECT TIENE_NIS
, COUNT(*) AS CNT
FROM UCOM.EJERCICIO
GROUP BY TIENE_NIS
