if [ $# -eq 2 ]; then
	if [ ! -d $1 ]; then
		echo "parametro 1 no es un directorio!"
		exit 1
	fi

	cd $1 # me dirijo a la ruta especificada

	for archivo in *; do
		if [ -f $archivo ]; then
			echo "elija una opcion (a - añadir $2 al final del nombre del archivo $archivo; b - añadir $2 al principio del nombre del archivo $archivo):"
			read opcion
			case $opcion in 
			a)
				mv $archivo ${archivo%.*}$2.${archivo##*.} # mover el archivo de una manera comoda, se le borra la extension al archivoi, 
				echo "nombre archivo modificado atrás"		# se le añade cadena junto, el punto de extension y la parte mascorta a partir de un punto ( extension)
				;;
			b)
				mv $archivo $2${archivo}
				echo " nombre archivo modificado adelante"
				;;

			*)	echo "nombre no valido!"
				;;			
			esac

		fi
	done
	
	echo "lista de elementos en carpeta"
	ls
else
	echo "error! faltan parametros!"
	exit 1
fi
