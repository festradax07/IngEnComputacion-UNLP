#!/bin/bash
if [ $# -lt 1 ]; then
	echo "cantidad de parametros incorrecta, por lo menos debe haber uno"
	exit 1
fi
cantidad=0
for archivo in "$@"; do
	if [ -f $archivo ]; then
		gzip $archivo
		echo "$archivo comprimido"
	elif [ -d $archivo ]; then
		if [ -r $archivo ]; then
			tar -czvf "$(basename $archivo).tar.gz" $archivo
			" $archivo empaquetado y comprimido"
		elif [ -w $archivo ]; then
			rm -r $archivo
			echo "$archivo removido y todo su contenido"
		fi
	elif [ -e $archivo ]; then
		(( cantidad ++ ))
	fi
done
echo "cantidad de archivos inexistentes:  $cantidad"
