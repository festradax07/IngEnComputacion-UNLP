#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo " elije opcion 1- directorio personal 2- ruta actual 3- espacio libre en disco "
read opcion 
case $opcion in
	1) echo "Su directorio personal es: $HOME";;
	2) echo "que envié la ruta del directorio que  quiere ver"
		#para probar si funcaba
		#directorio="/c/Users"
		read directorio
	if [ -d "$directorio" ]; then
		echo "contenido de $directorio"
		ls -l "$directorio"
	else echo "no existe ese directorio"
	fi
	;;
	3) 
		echo "espacio libre en disco:"
		df -h
		;;
	4) echo "salir del script.."
	   exit 0
	   ;;
esac


