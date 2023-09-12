SELECT A.*
, B.faja
, B.mora_30
FROM UCOM.clientes A
INNER JOIN UCOM.score_externo B ON B.documento = A.documento






SELECT A.*, B.*
FROM UCOM.clientes A
LEFT JOIN UCOM.score_externo B ON B.documento = A.documento

SELECT A.*
FROM UCOM.clientes A
FULL OUTER JOIN UCOM.score_externo B ON B.documento = A.documento
