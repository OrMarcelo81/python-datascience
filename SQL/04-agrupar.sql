/*
    La sintaxis agrupar por una o más columnas es:
    SELECT nombre_columna, nombre_columna, nombre_columna, ...
    <funcion de agregacion>
    FROM nombre_tabla
    GROUP BY nombre_columna;

    Nota: esto se parece a hacer una tabla dinámica de excel.
*/

-- cantidad de clientes por nivel de educación      
SELECT nivel_academico
, COUNT(*) AS cantidad_clientes  -- utilizamos un alias para nombrar la columna de salida
FROM UCOM.clientes
GROUP BY nivel_academico;

-- cantidad de clientes mayores de 40 años por nivel de educación 
SELECT nivel_academico
, COUNT(*) AS cantidad_clientes
FROM UCOM.clientes
WHERE edad > 40
GROUP BY nivel_academico;