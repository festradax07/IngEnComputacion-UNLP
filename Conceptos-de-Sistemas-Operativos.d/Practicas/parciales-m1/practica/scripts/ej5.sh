#!/bin/bash
#
if [ $# -ne 1 ]; then
	echo "error! se necesita un patrón como parametro"
	exit 1
fi

patron=$1
usuarios=($(grep "^$patron" /etc/passwd | cut -d: -f1))
if [ ${#usuarios[@]} -eq 0 ]; then
	echo "no hay usuario con el patrón solicitado"
	exit 2
fi

listar(){
	for i in ${!usuarios[@]}; do
		echo "${usuarios[$i]}"
	done
}

eliminar(){
	local index=$1
	if [ "$index" -lt 0 ] || [ "$index" -ge "${#usuarios[@]}" ]; then
		echo "problemas! indice no corresponde a ningun elemento del arreglo"
		return 3
	else
		unset usuarios[$index]
		usuarios=(${usuarios[@]})
		echo "eliminación completa"
	fi
}
contar(){
	echo "${#usuarios[@]}"
}

select opcion in "listar" "eliminar" "contar" "salir"; do
	case $opcion in 
		"listar")
			listar
			;;
		"eliminar") for i in ${!usuarios[@]}; do
				echo "${usuarios[$i]} | indice $i"
			done
			echo "elija un indice a borrar"
			read indice
			eliminar $indice
			;;
		"contar")
			contar
			;;
		"salir")
			echo "fin del proceso!"
			break
			;;
		*)	echo "opcion equivocada! selecciona el numero de la opcion correspondiente!"
			;;
		esac
done
