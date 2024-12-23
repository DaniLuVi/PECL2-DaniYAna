
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

        for valor in valores_tabla1:

            dato_adicional1 = {}

            for i in range(len(cur1.description)):

                nombre_dato1 = cur1.description[i].name

                valor_dato1 = valor[i]

                dato_adicional1[nombre_dato1] = valor_dato1

            datos_tabla1.append(dato_adicional1)


        cur2.execute("SELECT * FROM " + tabla2 + " WHERE " + atributo_introducir + " = " + atributo_introducido)

        datos_tabla2 = []

        valores_tabla2 = cur2.fetchall()

        for valor in valores_tabla2:

            dato_adicional2 =  {}

            for i in range(len(cur2.description)):

                nombre_dato2 = cur2.description[i].name

                valor_dato2 = valor[i]

                dato_adicional2[nombre_dato2] = valor_dato2

            datos_tabla2.append(dato_adicional2)

        print("Estos son los datos adicionales obtenidos del accidente con " + atributo_introducir + " = "  + atributo_introducido + " :\n" + datos_tabla1[0] + " \n" + datos_tabla2[0])

    except(Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:
        if conn is not None:
            conn.close()

def recuperar_datos_de_los_accidentes(tabla, atributo_introducir, tabla_adc1, tabla_adc2):
    print("Consultando de la base de datos la tabla " + tabla + " para recuperar los datos a partir de un 'collision_id' que va a pedir el usuario por pantalla.\n")
    atributo_introducido = int(input("Introduzca el valor del " + atributo_introducir +  " del que quiere ver sus datos: "))

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