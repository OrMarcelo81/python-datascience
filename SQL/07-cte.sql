WITH PROMEDIO AS (SELECT AVG(ingreso) AS PROMEDIO_INGRESO
                  FROM UCOM.clientes
                 )
SELECT A.*
FROM UCOM.clientes A
WHERE A.ingreso > (SELECT PROMEDIO_INGRESO FROM PROMEDIO)


-- Esto es lo mismo
SELECT A.*
FROM UCOM.clientes A
WHERE A.ingreso > (SELECT AVG(ingreso)
                   FROM UCOM.clientes
                  )





WITH MOROSOS AS (SELECT *
                 FROM UCOM.score_externo
                 WHERE mora_30 = 1
                 ),
     FAJA_H  AS (SELECT *
                 FROM MOROSOS
                 WHERE faja = 'H'
                )
SELECT A.*
FROM UCOM.clientes A
WHERE EXISTS (SELECT * FROM FAJA_H B WHERE B.documento = A.documento)
           

SELECT *
FROM UCOM.score_externo
where documento = 121959           