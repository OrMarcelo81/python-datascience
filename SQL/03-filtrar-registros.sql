/*
    La sintaxis para recuperar solo los registros que necesitamos es:
    SELECT *
    FROM nombre_tabla
    WHERE condicion;

    Nota: si existe más de una condición, se utilizan operadores booleanos.
*/

-- todos los clientes mayores de 40 años
SELECT *
FROM UCOM.clientes
WHERE edad > 40;