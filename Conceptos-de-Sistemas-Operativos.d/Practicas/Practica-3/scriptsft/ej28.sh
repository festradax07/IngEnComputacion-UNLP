#!/bin/bash
#
if [ $# -ne 1 ]; then
	echo "cantidad de parametros incorrectos! debe tener un directorio"
	exit 1
fi
directorio="$1"
if [ ! -d $directorio ]; then 
	echo "error! no es un directorio!"
	exit 4
fi
cantidad=0
for archivo in "$directorio"/*; do
	if [ -f "$archivo" ]; then 
		if [ -r "$archivo" ] && [ -w "$archivo" ]; then 
			echo "archivo $archivo"
			(( cantidad++))
		fi
	fi
done

echo "cantidad de archivo con permisos de lectura y escritura en $directorio : $cantidad"


