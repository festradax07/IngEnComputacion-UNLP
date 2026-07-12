#!/bin/bash
#
archivos=($(ls /var/log | grep "auth"))
cantidad(){
	echo "cantidad de archivos: ${#archivos[@]}"
}
listar(){
	echo "${archivos[@]}"
}
eliminar(){ # recibe en $1 el indice y en $2 l o f
	if [ $# -ne 2 ]; then
		echo " error! parametros incorrectos debe enviar un indice, y l o f dependiendo del borrado (logico o fisico)"
		return 1
	fi
	local indice=$1
	local tipo_borrado=$2
	if [ $indice -lt 0 ] || [ "$indice" -ge "${#archivos[@]}" ]; then
		echo "error! indice invalido debe ser entre 0 y $(( ${#archivos[@]} - 1))"
		return 2
	else
		case $tipo_borrado in 
			"l") unset archivos[$indice]
				archivos=("${archivos[@]}")
				echo "borrado logico exitoso"
				;;
			"f") rm /var/log/"${archivos[$indice]}"
			     unset archivos[$indice]
			     archivos=("${archivos[@]}")
			     echo "borrado logico y fisico exitoso"
			     ;;
			*)
				echo " parametro invalido, debe colocar l o f para indicar el parametro de borrado"
				;;
		esac
	fi
}
select opciones in "cantidad" "listar" "eliminar" "fin"; do
	case $opciones in 
		"cantidad") cantidad
			;;
		"listar") listar
			;;
		"eliminar")
			echo "escriba un indice"
			read indice
			echo "escriba que tipo de borrado desea l o f"
			read borrado
			eliminar $indice $borrado
			;;
		"fin")
			echo "fin del proceso!"
			exit 0
			;;
		*) echo "opcion incorrecta! elija alguna con el numero correspondiente"
			;;
		esac
done
