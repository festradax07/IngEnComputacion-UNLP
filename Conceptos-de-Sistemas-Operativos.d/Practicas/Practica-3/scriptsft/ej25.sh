#!/bin/bash
#
arreglo=($(cat /etc/group | cut -d: -f4 | tr ',' ' '))
opcion=$1
retornarPosicion(){
	local arg=$1
	if [ -z "$arg" ] || [ "$arg" -ge ${#arreglo[@]} ]; then
		echo "error! falta parametro de posicion"
	else
		echo "elemento en la posicion $arg es: ${arreglo[$arg]}"
		return 1
	fi
}
length(){
	echo "${#arreglo[@]}"
}
print(){
	echo "${arreglo[@]}"
}
case $opcion in 
	"-b") retornarPosicion $2
	      if [ $? -eq 1 ]; then
		exit 1
	      fi ;;
	"-l") length;;
	"-i") print ;;
	*) echo "opcion incorrecta, envie los parametros bien"

esac
