import sqlite3
conn = sqlite3.connect("./databases/tutorial.db")
cursor = conn.cursor()

cursor.execute("SELECT * from clientes")

for i in cursor.fetchall():
    print(i)