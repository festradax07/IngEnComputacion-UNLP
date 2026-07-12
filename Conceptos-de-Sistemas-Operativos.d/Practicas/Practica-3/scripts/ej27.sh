#!/bin/bash

inicializar(){
	array=()
}
agregar_elem(){
	array+=($1)
}
eliminar_elem(){
	if [ "$1" -ge 0 ] && [ "$1" -lt "${#array[@]}" ]; then
		unset array["$1"]
		array=("${array[@]}")		
	else
		echo "posición invalida."
	fi
}
longitud(){
	echo "${#array[@]}"
}
imprimir(){
	echo "${array[@]}"
}
inicializar_Con_Valores(){
	array=()
	for ((i=0; i<$1; i++)); do #bucle iterativo 
		array+=("$2")
	done
}

inicializar
agregar_elem 2
agregar_elem 4
imprimir            # Debería mostrar: Elemento1 Elemento2
longitud            # Debería mostrar: 2
eliminar_elem 0
imprimir            # Debería mostrar: 4
inicializar_Con_Valores 5 10
imprimir            # Debería mostrar: Valor Valor Valor Valor Valor
longitud            # Debería mostrar: 5

