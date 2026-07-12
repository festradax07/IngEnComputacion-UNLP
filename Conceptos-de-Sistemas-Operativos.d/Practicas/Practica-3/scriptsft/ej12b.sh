if [ $# -ne 2 ]; then
	echo "error! parametros incorrectos! deben ser 2 numeros"
	exit 1
fi
num1=$1
num2=$2
suma=$(($num1+$num2))
res=$(($num1-$num2))
mul=$(($num1*$num2))
echo "suma: $suma resta: $res mul: $mul"
if [ $num1 -lt $num2 ]; then
	echo "$num2 es mayor que $num1"
elif [ $num1 -gt $num2 ]; then
	echo "$num1 es mayor que $num2"
else
	echo "ambos numeros son iguales"
fi
