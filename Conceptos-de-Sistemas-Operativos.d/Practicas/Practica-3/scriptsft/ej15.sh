#!/bin/bash
#
archivo=archivoCut.txt
if [ ! -e archivo ]; then
	echo "soy un archivo de prueba, re piola, no?" > $archivo
fi
cut -c1-14 $archivo
cut -c1-4,8-11,27-34 $archivo
cut -d',' -f2 $archivo
cut -d' ' -f1,2,3,5 $archivo
cut -b1-4 $archivo
