#!/bin/bash
#esto devuelve el id en particular de users
group_id=$(grep "^users:" /etc/group | cut -d: -f3) 
usuarios=($(grep ":$group_id:" /etc/passwd | cut -d: -f1))
#arreglo inicializado con los id de grupo
while getopts "b:li" opcion; do
	case "$opcion" in 
		b)
			indice="$OPTARG"
			if [[ "$indice" -lt "${#usuarios[@]}" && "$indice" -ge 0 ]]; then
				echo "${usuarios[$indice]}"
			else
				echo "error! el $indice no existe en el arreglo"
			fi
			;;
		l)
			echo "Longitud del arreglo: ${#usuarios[@]}"
			;;
		i)	echo "${usuarios[@]}"
			;;
		*)	echo "opcion no valida: utilizar -b param1 ,-l o -i"
			;;
		esac
	done


