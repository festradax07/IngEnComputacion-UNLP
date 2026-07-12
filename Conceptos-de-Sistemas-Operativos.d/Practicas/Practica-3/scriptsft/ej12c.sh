if [ $# -ne 3 ]; then
	echo "error! parametros incorrectos! deben ser 3 numeros"
	exit 1
fi
es_op=false
operaciones=('*' '+' '-' '/')
for op in "${operaciones[@]}"; do
	if [ "$3" == "$op" ]; then
		es_op=true
		break;
	fi
done

if [ $es_op = false ]; then
	echo "error, el tercer parametro debe ser una operacion valida * + - % "
	exit 2
fi
                     
num1=$1              
num2=$2              
opcion=${3}
case $opcion in 
	+) resultado=$(($num1+$num2));;
	-) resultado=$(($num1-$num2));;
	'*') resultado=$(($num1*$num2));;
	/) if [ $num2 -eq 0 ]; then
		echo "error! division por cero"
		exit 3
	   fi
		resultado=$(($num1/$num2));;
esac
echo "resultado: $resultado"
