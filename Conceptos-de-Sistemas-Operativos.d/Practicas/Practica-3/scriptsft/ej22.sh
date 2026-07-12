#!/bin/bash
nums=(10 3 5 7 9 3 5 4)
echo "antes del producto: ${nums[@]}"
for i in ${!nums[@]}; do
	nums[$i]=$((nums[$i]*nums[$i]))
done
echo "despues del producto: ${nums[@]}"
