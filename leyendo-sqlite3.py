import sqlite3
import pandas as pd

# establecemos la conexion
conn = sqlite3.connect('./databases/UCOM.db')

# definimos la consulta
sql = """SELECT genero
         , count(*) as cantidad 
         FROM clientes 
         GROUP BY genero;
      """

# ejecutamos la consulta
df = pd.read_sql(sql, conn)

print(df)

conn.close()