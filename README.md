# Proyecto Bash - TP Linux

Este proyecto implementa un script en Bash que permite administrar un entorno de directorios y procesar archivos de texto con información de alumnos.

## ��� Estructura del entorno
Cuando se elige la opción **1 - Crear entorno**, se genera la carpeta `EPNro1` dentro del `home`, con tres subdirectorios:

- `entrada` → aquí se colocan los archivos `.txt` a procesar.
- `salida` → aquí se genera el archivo `FILENAME.txt` con los datos consolidados.
- `procesado` → aquí se mueven los archivos ya procesados.

## ⚙️ Funcionamiento
- **Opción 2 - Correr proceso:** ejecuta `consolidar.sh` en segundo plano.  
  Este script:
  1. Lee cada archivo de la carpeta `entrada`.
  2. Agrega su contenido al archivo `FILENAME.txt` en la carpeta `salida`.
  3. Mueve el archivo original a `procesado`.

- **Opción 3 a 5:** permiten consultar información desde `FILENAME.txt` (ordenar por padrón, mostrar las 10 mejores notas o buscar un padrón específico).

- **Opción 6 - Salir.**

- **Parámetro `-d`:** borra el entorno y finaliza procesos en background.

## ⚠️ Importante
Los archivos `.txt` que se coloquen en la carpeta `entrada` deben:
- Tener extensión `.txt`.
- Respetar el formato:  
  `Nro_Padron, Nombre y apellido, email, nota`
- **Finalizar con un salto de línea** (`\n`).  
  De lo contrario, los datos podrían quedar concatenados en la misma línea dentro de `FILENAME.txt`.

## ▶️ Ejecución
1. Definir la variable de entorno:  
   ```bash
   export FILENAME=ALUMNOS
2. Dar permisos de ejecución:
	chmod +x EjercicioBash.sh consolidar.sh
3.	Ejecutar el script principal:
	./EjercicioBash.sh

