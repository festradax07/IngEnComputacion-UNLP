#!/bin/bash
# NOTA: FIND DEVUELVE TODO EL PATH DEL ARCHIVO, DEBE RETIRARSE CON BASENAME
arreglo=( $(find /home -type f -name "*.doc" 2>/dev/null) )
ver_archivo(){ #$1 es nombre de archivo
	if [ $# -eq 0 ]; then 
		echo "no hay nombre disponible!"
		return 1
	fi
	for archivo in ${arreglo[@]}; do
		if [ "$( basename $archivo )" == "$1" ]; then 
			cat $archivo
			return 0 
		fi 
	done;

	echo "archivo inexistente"
	return 5
}
cantidad_archivos(){
	echo "cantidad de archivos .doc : ${#arreglo[@]}"
}
borrar_archivo(){
		for i in ${!arreglo[@]}; do
			if [ "$(basename ${arreglo[$i]})" == "$1" ]; then	
				select opcion in "si" "no"; do 
					case $opcion in 
					"si")
						unset arreglo[$i]
						arreglo=("${arreglo[@]}")
						;;
					"no")	
						unset arreglo[$i]
						arreglo=("${arreglo[@]}")
						rm -i "${arreglo[$i]}"
						;;
					*)	echo "opcion incorrecta, elija de nuevo!"
						;;
					esac
				done
				return 0
			fi
		done
		echo "archivo no encontrado"
		return 10
}
