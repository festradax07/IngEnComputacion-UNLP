#!/bin/bash
arreglo=()
inicializar(){
	arreglo=()
}
agregar_elem(){
	arreglo+=("$1")
}
eliminar_elem(){
	if [ ${#arreglo[@]} -lt "$1" ]; then
		echo "error! posicion invalida"
		exit 1
	fi
	unset arreglo[$1]
	arreglo=("${arreglo[@]}")
	#reacomodar arreglo

}
longitud(){
	echo "${#arreglo[@]}"
}
imprimir(){
	echo "${arreglo[@]}"
}
inicializarConValores(){
	#suponiendo que la longitud es parametro 1 y el elemento es parametro 2
	if [ $# -ne 2 ]; then
		exit 1
	fi
	arreglo=()
	for ((i=0; i<"$1"; i++))
       	do
		arreglo+=("$2")
	done
}

