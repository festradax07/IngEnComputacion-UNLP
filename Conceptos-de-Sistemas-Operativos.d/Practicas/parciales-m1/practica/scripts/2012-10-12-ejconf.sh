#!/bin/bash
archivos=()

cantidad(){
	echo "${#archivos[@]}"
}
verArchivos(){
	echo "${archivos[@]}"
}
existe(){
	if echo "${archivos[@]}" | grep -q "$1"; then
	   	echo "existe en archivo .conf de nombre "$1""
	else
		echo "no existe el archivo"
	fi	
}
eliminar(){
	local indice=0;
	for archivo in "${archivos[@]}"; do
		if [ $archivo == "$1" ]; then
			if [ "$2" == "logico" ]; then
				unset archivos[$indice]
			else
				unset archivos[$indice]
			       #borrar del filesystem
		       		rm "/etc/$archivo.conf"	       
			fi
		fi
		((indice++))
	done
	

}
archivos+=($(ls /etc/ | grep ".conf" | cut -d. -f1)) #parentesis de arreglo

