# importación de librerías
import mysql.connector
import json
import pandas as pd
import sqlite3

# se lee la configuración
with open("config.json", "r") as f:
    config = json.load(f)
    user = config['user']
    password = config['password']
    host = config['host']
    database = config['database']

# Establecer la conexión
conn = mysql.connector.connect(
    user = user,
    password = password,
    host = host,
    database = database
)

# la consula sql para traer la data de clientes
sql = "SELECT * FROM UCOM.clientes;"

# traemos los datos de MySQL
df = pd.read_sql(sql, conn)

# crear una conexion a sqlite3
connSQLite = sqlite3.connect('./databases/UCOM.db')

# utilizamos pandas para guardar el df en sqlite3
df.to_sql('clientes', connSQLite, if_exists='replace', index=False)

# cerrar las conexiones
conn.close()
connSQLite.close()