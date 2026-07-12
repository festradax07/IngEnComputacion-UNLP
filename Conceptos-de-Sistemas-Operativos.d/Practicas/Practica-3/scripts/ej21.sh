
#!/bin/bash
source ./ej20.sh
stack=()
#echo "$0" para testear la invocacion de la funcion y por qué no ejecuta el main del ejercicio 20 
for ((i=1;i<11;i++)); do
	push $i
done
pop
pop
pop
print
echo " la longitud de la stack es de $(length)"

