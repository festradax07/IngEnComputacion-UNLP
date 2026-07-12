#!/bin/bash
#
if [ -z "$1" ]; then
	echo "error! parametro vacio"
	exit 1
fi
usuario=$1
while true; do 
	if who | grep -wq "$usuario"; then
		echo "el usuario $usuario se logueo!"
		break;
	else
		echo "el usuario $usuario todavia no se ha logueado"
	fi
	sleep 10
done
