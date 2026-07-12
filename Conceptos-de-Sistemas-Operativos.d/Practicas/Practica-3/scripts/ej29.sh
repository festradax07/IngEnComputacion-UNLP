#!/bin/bash
archivos=($(ls /home | grep ".doc"))
verArchivo(){
	if $(echo "$archivos" | grep -q "$1"); then
		cat "/home/"$1""
	else
		echo "error! archivo no encontrado"
		return 5
	fi
}
cantidadArchivos(){
	echo "${#archivos[@]}"
}
borrarArchivos(){
local respuesta
while true; do
for indice in "${!archivos[@]}"; do
		if [ "${archivos[$indice]}" == "$1" ]; then
			read -p "¿Desea eliminar el archivo solo del arreglo? (si/no):" respuesta
			case "$respuesta" in 
			[sS][iI] | [Ss )
				unset archivos[$indice]
				break	
			;;
		[nN][oO] | [nN] )
			
			;;
		*)
			echo "Por favor, responda 'Si' o 'No'."
			;;
	esac
done
}
