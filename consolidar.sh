#!/bin/bash

while true; do
    
    for archivo in "$HOME/EPNro1/entrada"/*.txt; do 

        if [ -f "$archivo"]; then

            cat "$archivo" >> "$HOME/EPNro1/salida/$FILENAME.txt"

            mv "$archivo" "$HOME/EPNro1/procesado/"

        fi
    done

sleep 2 #Espera unos segundos antes de volver a revisar

done