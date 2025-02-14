#!/bin/bash
echo "Elija entre estas opciones: "
echo "1. Hola Mundo"
echo "2. Numero positivo/negativo"
echo "3. Fichero rexiste?"

read OPCION

case $OPCION in
	1)
	./ejercicioPropuesto8.sh;;
	
	2)
	./ejercicioPropuesto10.sh;;
	
	3)
	./ejercicioPropuesto9.sh;;
	
	*)
	echo "ERROR";;
esac

#if [ $OPCION -eq 1 ]; then
#./ejercicioPropuesto8.sh

#elif [ $OPCION -eq 2 ]; then
#./ejercicioPropuesto10.sh

#else
#./ejercicioPropuesto9.sh

#fi
