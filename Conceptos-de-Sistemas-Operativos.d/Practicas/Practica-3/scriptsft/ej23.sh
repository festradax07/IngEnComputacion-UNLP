#!/bin/bash
nums=(10 3 5 7 9 3 5 4)
imp=0
echo "elementos: ${nums[@]}"
for i in ${!nums[@]}; do
	if [ $(( nums[$i]%2 )) -eq 1 ]; then
		(( imp++ ))
	else
		echo "${nums[$i]} es un numero par"
	fi
done
echo "cantidad de impares: $imp"
