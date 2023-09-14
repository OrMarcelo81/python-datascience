import mysql.connector
import pandas as pd
import sqlite3
import json

# Leer la configuración
with open("config.json", "r") as f:
    config = json.load(f)
    user = config['user']
    password = config['password']
    host = config['host']
    database = config['database']

# Establecer la conexión a MySQL
conn_mysql = mysql.connector.connect(
    user=user,
    password=password,
    host=host,
    database=database
)

# Consulta SQL para seleccionar todos los registros de MySQL
consulta_mysql = "SELECT * FROM UCOM.clientes"

# Utilizar Pandas para cargar los datos desde MySQL
df = pd.read_sql(consulta_mysql, conn_mysql)

# Conectar a la base de datos SQLite3
con_sqlite = sqlite3.connect("./databases/tutorial.db")

# Utilizar Pandas para escribir los datos en SQLite3
df.to_sql('clientes', con_sqlite, if_exists='replace', index=False)  # Cambia 'replace' a 'append' si es necesario

# Cerrar las conexiones
conn_mysql.close()
con_sqlite.close()