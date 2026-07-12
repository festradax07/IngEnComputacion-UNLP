 #!/bin/bash
 #
 if [ $# -ne 3 ]; then
	 echo "error! debe tener parametro el directorio, parametro a o b y la cadena a agregar"
	 exit 1
fi
directorio=$1
opcion=$2
cadena=$3
if [ -e $directorio ] && [ -d $directorio ]; then
	for archivo in "$directorio"/*; do
		if [ -f $archivo ]; then
			case $opcion in 
			"a") mv $archivo "${archivo}${cadena}";;
			"b") mv $archivo "${directorio}/${cadena}$(basename $archivo)";;
			esac
		fi	
	done
fi
