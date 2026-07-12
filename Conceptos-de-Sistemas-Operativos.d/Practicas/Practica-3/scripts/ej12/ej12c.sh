if [ $# -eq 3 ]; then 
	case $3 in 
	 +)	
		 resultado=$(( $1 + $2 ))
		 echo "el resultado de la suma es ${resultado}"
		 ;;
	-)	
		resultado=$(( $1 - $2 ))
		echo "el resultado de la resta es ${resultado}"
		;;

	\*)	
		resultado=$(( $1 * $2 ))
		echo "el resultado de la multiplicacion es ${resultado}"
		;;

	/)	if [ $2 -ne 0 ]; then 
			resultado=$(( $1 / $2 ))
			echo " el resultado de la division es ${resultado}"
		else
			echo " ERROR! no se puede dividir por 0!"
		fi
		;;
	*)	echo "opcion invalida. Intentalo de nuevo."
		;;
	esac
	exit 0
else
	exit 1 
fi
