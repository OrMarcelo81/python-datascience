SELECT documento
, 'A' AS ORIGEN
FROM UCOM.clientes
WHERE edad = 40
UNION
SELECT documento
, 'B' AS ORIGEN
FROM UCOM.score_externo
WHERE faja = 'H'