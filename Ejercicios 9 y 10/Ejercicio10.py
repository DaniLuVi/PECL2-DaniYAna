
import psycopg2
from Ejercicio9.py import conectar

def mostrar_datos_adicionales(tabla1, tabla2):


def recuperar_datos_de_los_accidentes(tabla, atributo_introducir):
    print("Consultando de la base de datos la tabla " + tabla + "para recuperar los datos a partir de un 'collision_id' que va a pedir el usuario por pantalla.\n")
    atributo_introducido = str(input("Introduzca el valor del 'collision_id' del que quiere ver sus datos: "))

    conn = conectar()

    try:
        cur =  conn.cursor()

        cur.execute("SELECT * FROM " + tabla + "WHERE " + atributo_introducir + " = " + atributo_introducido)


    except(Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:
        if conn is not None:
            conn.close()