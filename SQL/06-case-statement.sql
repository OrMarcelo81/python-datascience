SELECT EDAD
, CASE 
  WHEN edad <= 25 THEN '<= 25'      -- esto va a hacer primero
  WHEN edad <= 40 THEN '26 - 40'    -- después va a hacer esto
  WHEN edad <= 60 THEN '41 - 60'    -- después esto
  ELSE '> 60'                       -- finalmente esto
  END AS RANGO_EDAD
FROM UCOM.clientes
LIMIT 10


SELECT EDAD
, CASE 
  WHEN (edad >= 0) or (edad <= 25)  THEN '0 - 25'      -- esto va a hacer primero
  WHEN edad >= 26 and edad <= 40 THEN '26 - 40'    -- después va a hacer esto
  WHEN edad >= 41 and edad <= 60 THEN '41 - 60'    -- después esto
  ELSE '> 60'                                     -- finalmente esto
  END AS RANGO_EDAD
FROM UCOM.clientes
LIMIT 10


SELECT A.*
, CASE WHEN edad > 30 and nivel_academico = 'primario' THEN 1
       WHEN edad > 40 and nivel_academico = 'terciario' THEN 1
       ELSE 0
       END AS BANDERA
FROM UCOM.clientes A
LIMIT 10