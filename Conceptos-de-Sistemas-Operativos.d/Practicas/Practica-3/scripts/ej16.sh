#!/bin/bash
if [ $# -eq 0 ]; then 
	echo" no se mando ningun parametro: param1: extension"
	exit 1
fi 	
echo -n > registro.txt
for linea in $(cat /etc/passwd | cut -d: -f 1,6); do
	user=$(echo $linea | cut -d: -f1)
	home=$(echo $linea | cut -d: -f2)
	#echo "Usuario: $user - Home: $home"
	if [ -d $home ]; then # si es la ruta de un dir
	  echo "$user  $(find $home -name "*.$1"| wc -l)" >> registro.txt
	fi
done
