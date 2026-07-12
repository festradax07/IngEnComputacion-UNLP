echo "añade numero 1"
read numero1
echo " añade numero 2"
read numero2

suma=$(( numero1 + numero2))
resta=$((numero1 - numero2))
multiplicacion=$((numero1*numero2))

echo $suma
echo $resta
echo $multiplicacion
if [ $numero1 -gt $numero2 ]; then
	echo "${numero1} es mayor que ${numero2}"
elif [ $numero1 -lt $numero2 ]; then
	echo "${numero1} es menor que ${numero2}"
else
	echo "ambos numeros valen ${numero1}"
fi

