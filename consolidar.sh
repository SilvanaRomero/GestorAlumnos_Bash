#!/bin/bash

ENTRADA="$HOME/EPNro1/entrada"
SALIDA="$HOME/EPNro1/salida/$FILENAME.txt"
PROCESADO="$HOME/EPNro1/procesado"

while true; do
    
    for archivo in "$ENTRADA"/*.txt; do 

        if [ -f "$archivo"]; then

            cat "$archivo" >> "$SALIDA"

            mv "$archivo" "$PROCESADO"

        fi
    done

    sleep 0.05 #Espera unos segundos antes de volver a revisar

done