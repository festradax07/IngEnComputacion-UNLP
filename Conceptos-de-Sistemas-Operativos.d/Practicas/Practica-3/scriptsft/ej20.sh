#!/bin/bash
#
# pila estructura lifo
arreglo=()
indice=0
push(){
arreglo+=("$1")
echo "agregado elemento "$1" a la pila"
(( indice++ ))
}
pop(){
	unset arreglo[$indice]
	(( indice-- ))
	arreglo=(${arreglo[@]})
	echo "desapilado ultimo elemento ingresado"
}
length(){
	echo "${#arreglo[@]}"
}
print(){
	echo "${arreglo[@]}"
}

select opcion in "push" "pop" "length" "print" "salir"; do
	case $opcion in 
		push) echo "ingrese elemento a añadir"
			read elem
			push $elem;;
		pop) pop;;
		length) length;;
		print) print;;
		salir) echo "saliendo del programa"
			break;;
		*) echo" opcion no valida! pruebe de nuevo";;
	esac
done
