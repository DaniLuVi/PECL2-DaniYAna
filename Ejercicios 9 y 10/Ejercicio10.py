
import psycopg2
from Ejercicio9.py import conectar # type: ignore

def mostrar_datos_adicionales(atributo_introducir, atributo_introducido, tabla1, tabla2):
    print("Además, también se van a mostrar unos datos adicionales, de las tablas: " + tabla1 + " y " + tabla2 + ".\n")

    conn = conectar()

    try:
        cur1 = conn.cursor()

        cur2 = conn.cursor()

        cur1.execute("SELECT * FROM " + tabla1 + " WHERE " + atributo_introducir + " = " + atributo_introducido)
        
        datos_tabla1 = []

        valores_tabla1 = cur1.fetchall()


        
        cur2.execute("SELECT * FROM " + tabla2 + " WHERE " + atributo_introducir + " = " + atributo_introducido)

        datos_tabla2 = []

        valores_tabla2 = cur2.fetchall()




    except(Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:
        if conn is not None:
            conn.close()

def recuperar_datos_de_los_accidentes(tabla, atributo_introducir, tabla_adc1, tabla_adc2):
    print("Consultando de la base de datos la tabla " + tabla + " para recuperar los datos a partir de un 'collision_id' que va a pedir el usuario por pantalla.\n")
    atributo_introducido = str(input("Introduzca el valor del " + atributo_introducir +  " del que quiere ver sus datos: "))

    conn = conectar()

    try:
        cur =  conn.cursor()

        cur.execute("SELECT * FROM " + tabla + " WHERE " + atributo_introducir + " = " + atributo_introducido + " \n")

        datos_recuperados = []

        valores = cur.fetchall()

        for valor in valores:
            
            dato = {}

            for i in range(len(cur.description)):
                nombre_dato = cur.description[i].name

                valor_dato = valor[i]

                dato[nombre_dato] = valor_dato
        
            datos_recuperados.append(dato)

        print("Estos son los datos recuperados del accidente con " + atributo_introducir + " = " + atributo_introducido + ":\n" + datos_recuperados[0] + " \n\n")

        mostrar_datos_adicionales(atributo_introducir, atributo_introducido, tabla_adc1, tabla_adc2)

        print("\n\n")

        cur.close()

    except(Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:
        if conn is not None:
            conn.close()