import pip
pip.main(["install", "mysql-connector-python"])
import mysql.connector, json

# se lee la configuración
with open("config.json", "r") as f:
    config = json.load(f)
    user = config['user']
    password = config['password']
    host = config['host']
    port = config['port']
    database = config['database']

# Establecer la conexión
conn = mysql.connector.connect(
    user = user,
    password = password,
    host = host,
    port = port,
    database = database
)

# Crear un cursor para ejecutar consultas
cursor = conn.cursor()

# Ejecutar una consulta
consulta = "SELECT * FROM ucom.clientes LIMIT 5;"
cursor.execute(consulta)

# Obtener los resultados de la consulta
resultados = cursor.fetchall()

# Recorrer los resultados
contador = 0
for fila in resultados:
    print(fila)
    contador += 1
    if contador == 20:
        break

# Cerrar el cursor y la conexión
cursor.close()
conn.close()