#!/bin/bash
read -p "Introduce un número: " Numero

if [ $Numero -eq 0 ]; then
	echo "El numero es 0"
elif [ $Numero -gt 0 ]; then
        echo "El numero $Numero es positivo"
else
        echo "El numero $Numero es negativo"
fi

