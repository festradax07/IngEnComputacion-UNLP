#!/bin/bash
# simular una pila con los elementos
# inicialmente vacia
# estructura lifo, por lo que debo llevar la estructura con la dimlogica
# representaremos un arraylist con agregar atras, basicamente
#programa principal
stack=()
push(){
	stack+=("$1")
	echo "se añadio el elemento "$1" a la stack"
}
pop(){
	if [ ${#stack[@]} -eq 0 ]; then
		echo "stack vacia, no se puede realizar un pop"
	else
		unset stack[-1]
		echo "ultimo elemento eliminado de la stack"
	fi
}
print(){
	if [ ${#stack[@]} -eq 0 ]; then
		echo "stack vacia, no se puede realiazar un pop"
	else
		echo "${stack[@]}"
	fi
}
length(){
	echo "${#stack[@]}"
}
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
while true; do
    	echo -e "\nMENU DE PILA:"
    	echo "1. Agregar elemento (push)"
    	echo "2. Quitar elemento (pop)"
    	echo "3. Mostrar elementos de la pila"
    	echo "4. Mostrar longitud de la pila"
    	echo "5. Salir"

	read opcion
	case $opcion in 
	1) 	read -p "escriba el elemento a pushear" elemento
		push "$elemento"
	;;
	2) 	pop 
	;;
	3) 	print
	;;
	4) 	length
	;;
	5)	exit 0
	;;
	*)	 echo "error! opcion invalida! elija una opcion de las siguientes"
	;;
	esac
done
fi
