import mysql.connector, json
from mimodulo import misql

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

ingreso = misql.ingreso_cliente(cedula=113807, conn=conn)

na_117640 = misql.na_cliente(cedula=117640, conn=conn)
na_113807 = misql.na_cliente(cedula=113807, conn=conn)

print(na_117640)
print(na_113807)
