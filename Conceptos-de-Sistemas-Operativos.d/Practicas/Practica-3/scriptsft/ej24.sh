#!/bin/bash
#
vector1=(1 2 3 4)
vector2=(5 6 7 8)
echo "vector1 : ${vector1[@]}"
echo "vector 2: ${vector2[@]}"
for i in ${!vector1[@]}; do
	echo "la suma de los elementos de la pos $i de los vectores es $(( vector1[$i] + vector2[$i] ))"
done
