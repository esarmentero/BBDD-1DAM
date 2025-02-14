#!/bin/bash
read -p "Introduce el nombre del directorio" NOMBRE

if [ -f $NOMBRE ]; then
        echo "El directorio existe"
else 
        echo "El directorio  no existe"
	mkdir $NOMBRE
fi
