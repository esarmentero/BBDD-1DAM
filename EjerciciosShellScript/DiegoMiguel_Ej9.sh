 #!/bin/bash
read -p "Introduce el nombre del archivo:" archivo

# -e  comprueba si un archivo existe, independiente si es directorio o no
# -f comprueba si es un archivo regular, no un directorio
if [ -f "$archivo" ]; then
	echo "El archivo existe."
else 
	echo "El archivo no existe."
fi
