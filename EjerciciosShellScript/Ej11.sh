#!/bin/bash
read -p "Introduce el nombre del archivo: " NOMBRE

NUMLINEAS=$(wc -l < $NOMBRE) #< para redireccionar entrada
echo El número de líneas es: $NUMLINEAS