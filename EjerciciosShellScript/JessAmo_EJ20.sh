#!/bin/zsh
ps aux
read -p "Quieres buscar un proceso especifico?(0 para salir): " PROCESO

if [ $PROCESO -eq 0 ]; then
    echo "Saliendo..."
else
    ps aux | grep $PROCESO
fi
