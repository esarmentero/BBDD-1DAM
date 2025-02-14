#!/bin/bash
read -p "Introduce el nombre del archivo: " ARCHIVO
if [ -a $ARCHIVO ]; then
	TIPO=$(file &ARCHIVO)
	echo $TIPO
else
	echo "No existe"
fi