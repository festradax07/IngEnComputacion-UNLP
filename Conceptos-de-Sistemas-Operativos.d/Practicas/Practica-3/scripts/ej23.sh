#!/bin/bash
num=(10 3 5 7 9 3 5 4)
impares=0
for i in "${num[@]}"; do
	if [ $((i % 2)) -eq 0 ]; then
	       echo "$i es un numero par"
       else
	       ((impares++)) #forma comun es impares=$((impares + 1))	
	fi
done
echo "los numeros impares son $impares elementos"	
