#!/bin/bash
# cada parametro recibido debe ser la ruta absoluta de un archivo o directorio
if [ $# -eq 0 ]; then
	echo "error! falta de parametros! cada parametro debe ser una ruta"
	exit 1
fi
rutas=($*)
non_existing_d=0
non_existing_f=0
for indice in ${!rutas[@]}; do
    if [ $(($indice % 2)) -eq 1 ]; then
       	ruta="${rutas[$indice]}"
	 if [ -e "$ruta" ]; then
 		if [ -d "$ruta" ]; then
			echo "la ruta "$ruta" pertenece a un directorio"
		else
			echo "la ruta "$ruta" pertenece a un archivo"
		fi
	else
		if [[ "$ruta" == *.* ]]; then
			((non_existing_f++))
		else
			((non_existing_d++))
		fi
	fi
    fi
done	
echo "la cantidad de archivos no existentes son "$non_existing_f"!"
echo "la cantidad de directorios no existentes son "$non_existing_d"!"

