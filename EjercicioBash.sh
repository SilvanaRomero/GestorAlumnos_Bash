#!/bin/bash

parametro=$1

if [ "$parametro" = "-d" ]; then
	
	#Verificar si existe y borrar el entorno

	if [ -d "$HOME/EPNro1" ]; then
		rm -rf "$HOME/EPNro1"
		echo "Directorio EPNro1 eliminado."
	else
		echo "No existe el directorio EPNro1."
	fi 
	
	#Verificar la existencia y mata procesos creados en background

	proceso=$(pgrep -f "consolidar.sh") #Contiene los PID (Id de procesos que se esten ejecutando consolidar.sh
	if [ -n "$proceso" ]; then
		kill $proceso
		echo "Procesos consolidar.sh detenidos."
	else
		echo "No hay procesos consolidar.sh activos."
	fi
	
	exit 0
	
else
	# De no existir la variable de FILENAME la exporta
	if [ -z "$FILENAME" ]; then
    echo "La variable FILENAME no está definida."
    echo -n "Por favor, ingrese un nombre para el archivo: "
    read nombre
    export FILENAME=$nombre
    echo "Variable FILENAME definida como: $FILENAME"
	fi
fi

	while [ "$opcion" != 6] ; do # se ejecuta hasta que el usuario elija salir

		echo "------- MENÚ -------"
		echo " 1) Crear entorno "
		echo " 2) Correr proceso "
		echo " 3) Mostrar listado "
		echo " 4) Mostrar notas "
		echo " 5) Consultar información "
		echo " 6) Salir "
		echo "--------------------"
		echo -n "Elija una opción: "
		read opcion

		case $opcion in
			1)
				echo "---- Creando entorno ----"
				mkdir -p ~/EPNro1 #evita error si la carpeta ya existe
				mkdir -p ~/EPNro1/entrada
				mkdir -p ~/EPNro1/salida
				mkdir -p ~/EPNro1/procesado
				echo "Entorno y archivos creados correctamente"
				;;
		
			2)
				echo "---- Corriendo proceso en background ----"
				chmod +x ./consolidar.sh
				./consolidar.sh & 				
				;;

			3)
				
				echo "Listado de alumnos ordenado por padrón: "
				sort -n "$HOME/EPNro1/salida/$FILENAME.txt" 
				echo "---------- Fin de listado ----------"

				
				;;
			4)
				echo "Top 10 de alumnos con mejores notas: "
				sort -k4 -nr "$HOME/EPNro1/salida/$FILENAME.txt" | head -n 10 #Ordena por notas y muestra las primeras 10 lineas 
				echo "---------- Fin de listado ----------"

				;;
			5)

				read -p "Ingrese el número de padrón: " padron
				resultado=$(grep "^$padron" "$HOME/EPNro1/salida/$FILENAME.txt")

				if [ -z "$resultado" ]; then
					echo "Padrón no encontrado."
				else
					echo "Datos del padrón: $padron:"
					echo "$resultado"
				fi
				;;
			6)
				echo "Saliendo del programa..."
				exit 0
				;;
		
		esac
	
	done
			