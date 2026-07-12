#!/bin/bash
#
if [ $# -lt 1 ]; then 
	echo "faltan por lo menos un parametro, deben ser la ruta absoluta de un archivo"
	exit 1
fi
inexistente=0
archivos=( "$@" )
for i in ${!archivos[@]}; do
	if (( $i % 2  != 0)); then 
		if [ -e ${archivos[$i]} ]; then
			echo "el archivo o directorio ${archivos[$i]} existe"
		else
			(( inexistente++ ))
		fi
	fi
done
echo "cantidad archivos inexistentes: $inexistente"


