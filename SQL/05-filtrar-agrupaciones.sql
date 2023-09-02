/*
    La sintaxis de HAVING, que es el parámetro que nos permite filtrar resultados de una agrupación:
    SELECT nombre_columna, agregación
    FROM nombre_tabla
    GROUP BY nombre_columna
    HAVING condición;

    Nota: esto sería como filtrar los resultados de una tabla dinámica de excel.
*/

-- cantidad de clientes en el nivel de educación primario      
SELECT nivel_academico
, COUNT(*) AS cantidad_clientes
FROM UCOM.clientes
GROUP BY nivel_academico
HAVING nivel_academico = 'primario';