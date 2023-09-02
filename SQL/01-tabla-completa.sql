/*
    La sintaxis para recuperar todos los datos pero solo las columnas de nuestro interés es:
    SELECT nombre_columna_1, nombre_columna_2, ... 
    FROM nombre_tabla;

    Nota: notar que los nombres de las columnas están separadas por comas.
*/

-- todos los datos de las columnas 'documento' y 'edad' de la tabla clientes
SELECT documento, edad
FROM UCOM.clientes