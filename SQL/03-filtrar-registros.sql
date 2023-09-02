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
 
-- todos los clientes mayores de 40 años y nivel académico primario
SELECT *
FROM UCOM.clientes
WHERE edad > 40 AND nivel_academico = 'primario';

-- podríamos encerrar entre paréntesis las condiciones del where para dar claridad
SELECT *
FROM UCOM.clientes
WHERE ( edad > 40 ) AND ( nivel_academico = 'primario' );

/*
    Cuando utilizamos operadores booleanos, podemos utilizar los operadores léxicos:
    > mayor que
    < menor que
    >= mayor o igual que
    <= menor o igual que
    = igual que
    != diferente de
    LIKE
    IN
    BETWEEN
    IS NULL
    IS NOT NULL
    AND (ambas condiciones deben ser true)
    OR (al menos una debe ser true)
    NOT
    EXISTS
*/

-- todos los clientes mayores de 40 años o nivel académico primario
SELECT *
FROM UCOM.clientes
WHERE ( edad > 40 ) OR ( nivel_academico = 'primario' );