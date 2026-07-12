echo "elija un numero"
read a
echo "elija otro numero"
read b
suma=$(($a+$b))
res=$(($a-$b))
mul=$(($a*$b))
echo "suma: $suma resta: $res mul: $mul"
if [ $a -lt $b ]; then
	echo "$b es mayor que $a"
elif [ $a -gt $b ]; then
	echo "$a es mayor que $b"
else
	echo "ambos numeros son iguales"
fi
