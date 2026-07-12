if [ $# -ne 1 ]; then
	echo "error! parametros mal utilizados, necesita nombre del archivo solamente"
	exit 1
fi
archivo=$1
if [ -e $archivo ]; then
	if [ -f $archivo ]; then 
		echo " $archivo existe y es un archivo"
	elif [ -d $archivo ]; then
		echo " $archivo existe y es un directorio"
	fi
else
	echo " $archivo no existe"
	mkdir "$archivo"
	echo "directorio $archivo creado exitosamente"
fi
