if [ $# -eq 2 ]; then 
	suma=$(( $1 + $2))
	resta=$(($1 - $2))
	multiplicacion=$(($1*$2))

	echo $suma
	echo $resta
	echo $multiplicacion
	if [ $1 -gt $2 ]; then
		echo "$1 es mayor que $2"
	elif [ $1 -lt $2 ]; then
		echo "$1 es menor que $2"
	else
		echo "ambos numeros valen $1"
	fi
	exit 0
else 
	exit 1
fi
