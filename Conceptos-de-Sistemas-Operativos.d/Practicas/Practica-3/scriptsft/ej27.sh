#!/bin/bash
#
arreglo=( )
inicializar(){
	arreglo=()
}
agregar_elem(){ #requiere elem en $1
	arreglo+=("$1")
}
eliminar_elem(){#eliminar elem en pos $1
	local pos=$1
	if [ $pos -lt 0] && [ $pos -le $(( ${#arreglo[@]} - 1)) ]; then
		unset arreglo[$pos]
		arreglo=("${arreglo[@]}")
	fi
}
longitud(){
	echo "${#arreglo[@]}"
}
imprimir(){
	echo "${arreglo[@]}"
}
inicializar_con_valores(){ #crea arreglo de longitud $1 y asigna $2
	local long=$1
	local valor=$2
	if [ $long -lt 1 ]; then
		echo "error! la longitud debe ser mayor a 0!"
	fi
	arreglo=()
	for (( i = 0; i < $long; i++ )); do
			arreglo+=("$valor")
	done
}
