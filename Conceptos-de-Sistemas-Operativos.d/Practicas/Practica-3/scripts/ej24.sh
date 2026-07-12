#!/bin/bash

vector1=(1 7 9 10)
vector2=(2 3 1 11)
vector3=()
for i in "${!vector1[@]}"; do
	vector3+=($((${vector1[$i]} + ${vector2[$i]})))
       	echo "la suma de los elementos de la posicion "$i" de los vectores es ${vector3[$i]}"
done
echo "${vector3[@]}"
