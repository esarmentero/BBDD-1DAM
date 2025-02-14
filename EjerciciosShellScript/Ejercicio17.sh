#!/bin/bash
SUMA=0

for i in {1..10}; 
do
	SUMA=$(($SUMA + i))
done

echo "La suma de los números del 1 al 10 es: $SUMA"
