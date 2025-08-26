#!/bin/bash

parametro=$1

if [ "$parámetro" = "-d" ]; then
	
	#Verificar si existe y borrar el entorno

	if [ -d "$HOME/EPNro1"]; then
		rm -rf "$HOME/EPNro1"
		echo "Directorio EPNro1 eliminado."
	else
		echo "No existe el directorio EPNro1."
	fi 
	
	#Verificar la existencia y mata procesos creados en background

	processes=$(pgrep -f "consolidar.sh") #Contiene los PID (Id de procesos que se esten ejecutando consolidar.sh
	if [ -n "$processes" ]; then
		kill $processes
		echo "Procesos consolidar.sh detenidos."
	else
		echo "No hay procesos consolidar.sh activos."
	fi
	
	exit 0
	
else
	while true; do # se ejecuta hasta que el usuario elija salir

		echo "------- MENÚ -------"
		echo " 1) Crear entorno "
		echo " 2) Correr proceso "
		echo " 3) Mostrar listado "
		echo " 4) Mostrar notas "
		echo " 5) Consultar información "
		echo " 6) Salir "
		echo "--------------------"
		echo -n "Elija una opción: "
		read option

		case $option in
			1)
				echo "---- Creando entorno ----"
				mkdir -p ~/EPNro1 #evita error si la carpeta ya existe
				mkdir -p ~/EPNro1/entrada
				mkdir -p ~/EPNro1/salida
				mkdir -p ~/EPNro1/procesado
				touch ~/EPNro1/salida/$FILENAME.txt
				touch ~/EPNro1/consolidar.sh 
				echo "Entorno y archivos creados correctamente"
				;;
		
			2)
				echo "---- Corriendo proceso ----"
				cd ~/EPNro1
				./consolidar.sh
				;;

			3)
				;;
			4)
				;;
			5)
				;;
			6)
				;;
		
		esac
	
	done
			
			

fi