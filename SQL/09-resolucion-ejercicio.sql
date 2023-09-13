/*
1) Identificar a los Funcionarios Públicos que son nuestros clientes,
y contrastar el ingreso declarado con el salario que figura en la
nómina de Hacienda.
*/
WITH ORIGEN AS (SELECT CODIGO_PERSONA
                , SUM(MONTO_DEVENGADO) AS TOTAL_INGRESOS
                FROM UCOM.FUNCIONARIOS
                GROUP BY CODIGO_PERSONA
               ),
     DATOS  AS (SELECT A.*
                , LPAD(A.documento, 15, '0') AS DOCUMENTO_FORMATEADO
                FROM UCOM.clientes A
               )               
SELECT A.*
, B.TOTAL_INGRESOS
FROM DATOS A
INNER JOIN ORIGEN B ON B.CODIGO_PERSONA = A.DOCUMENTO_FORMATEADO


/*
2) Crear un dataset a nivel cliente que contenga esta información:
DOCUMENTO
EDAD
NIVEL_ACADEMICO
GENERO
ES_FUNCIONARIO (BINARIO)
VACUNADO (BINARIO)
TIENE_NIS (BINARIO)
FAJA
MORA_30 (TARGET)
*/
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