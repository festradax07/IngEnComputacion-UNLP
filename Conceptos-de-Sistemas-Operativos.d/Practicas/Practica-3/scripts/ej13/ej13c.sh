if [ -e $1 ]; then
	if [ -d $1 ]; then
		echo "archivo ya existe y es un directorio"
	elif [ -f $1 ]; then
		echo "archivo ya existe y es un archivo"
	else
		echo " archivo existe pero no es ni archivo ni directorio".
	fi
else 
	if [[ $1 == *.* ]]; then
		touch $1
		echo " archivo creado"
	else
		mkdir $1
		echo "directorio creado"
	fi
fi
