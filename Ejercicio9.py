

import psycopg2
import random

def conectar():
    conn = None
    print("Conectándose a la base de datos")
    try:
        conn = psycopg2.connect(
            host = "localhost",
            database = "pecl2",
            user = "postgres",
            password = "Jaque35729,Q",
            port = "5432"
        )

    except (Exception, psycopg2.DatabaseError) as error: 
        print(error)

    return conn

def consultar_tabla(tabla, nresult):
    print("Consultando en la base de datos, la tabla " + tabla + "con " + nresult + "resultados.")

    conn = conectar()

    try:
        cur = conn.cursor()

        cur.execute("SELECT * FROM " + tabla + "LIMIT" + nresult + ";")

        rows = cur.fetchall()

        resultado = []

        for row in rows:
            registro = {}

            for i in range(len(cur.description)):
                nombre_columna = cur.description[i].name

                valor_columna = row[i]

                
    

def consultar_personas()
    
def consultar_vehiculos()
    
def consultar_accidentes()