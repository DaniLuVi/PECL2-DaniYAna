

import psycopg2


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

                registro[nombre_columna] = valor_columna
            
            resultado.append(registro)

        for i in range(nresult):
            print(resultado[i])

        cur.close()

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:

        if conn is not None:
            conn.close()


print("EJERCICIO 9\nMostrar 10 personas, 10 vehículos y 10 accidentes en las correspondientes tablas, con todos los atributos asociados.\n")

consultar_tabla("final.persona", 10)

consultar_tabla("final.vehiculo", 10)

consultar_tabla("final.accidentes", 10)

print("Fin del programa.\n")

exit()