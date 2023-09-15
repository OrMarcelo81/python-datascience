/*
    Sentencia para crear una columna
*/

ALTER TABLE UCOM.clientes ADD COLUMN direccion VARCHAR(255);

-- Verificamos que la columna se haya creado
SELECT * FROM UCOM.clientes limit 10;

-- Insertamos un dato para un cliente
UPDATE UCOM.clientes 
SET direccion = 'Calle falsa 123' 
WHERE documento = 113807;