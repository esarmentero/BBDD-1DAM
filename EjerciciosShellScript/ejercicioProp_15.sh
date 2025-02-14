#!/bin/bash

let SUMA=0

for C in $( cat numero.txt ); do
	let SUMA=C+SUMA
done

echo $SUMA
