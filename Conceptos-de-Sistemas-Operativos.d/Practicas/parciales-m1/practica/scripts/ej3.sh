#!/bin/bash
#
if [ $# -ne 1 ]; then
	echo "error! falta el parametro de patron de texto"
	exit 1
fi

if [ -z "$SERVICE" ]; then
	SERVICE="apt"
fi
echo "cantidad de archivos con patrón "$1" en /var/log/"$SERVICE": $(ls /var/log/"$SERVICE" | grep "$1" | wc -l)"



