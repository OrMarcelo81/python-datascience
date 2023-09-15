/*
    Creación de una vista de tabla
*/
CREATE VIEW UCOM.V_CURSO_PYTHON AS 
SELECT * 
FROM UCOM.clientes
WHERE edad = 40;

-- Vemos la vista que creamos.
SELECT *
FROM UCOM.V_CURSO_PYTHON
WHERE genero = 'femenino'


-- sí creamos un backup
CREATE TABLE UCOM.clientes_bk AS (
SELECT *
FROM UCOM.clientes
) 

