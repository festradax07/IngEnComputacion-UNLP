#!/bin/bash
#
if [ $# -ne 1 ]; then
	echo "error! parametros incorrectos! debe tener un nombre de usuario"
	exit 2
fi
nombre=$1
if $( grep -q "^$nombre:" "/etc/passwd" ); then 
	echo "es un nombre de usuario"
	cantidad=0
	while (true); do 
		linea=$(who | grep "$nombre" | cut -d' ' -f1)
		if [ -n "$linea" ]; then
			(( cantidad++ ))
			echo "$linea || $(date)" >> historial.txt
		fi
		if (( $cantidad == 30 )); then 
			echo "el usuario se registró logueado 30 veces"
			return 0 
		fi
		sleep 10
	done

else
	echo "$nombre no es un usuario del sistema!"
	exit 1
fi

	
	
