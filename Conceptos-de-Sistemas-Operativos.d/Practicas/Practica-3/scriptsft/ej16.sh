#!/bin/bash
#
if [ $# -ne 1 ]; then
	echo "error! parametro erroneos, solo debe enviar una extensión"
	exit 1
fi
exten=$1
reporte=reporte.txt
if [ ! -e $reporte ]; then
	echo -e "reporte de usuarios con archivo $exten\n---------\n" > $reporte
	echo -e "usuario\tarchivos\n" >> $reporte
fi
for usuarios in $(cat /etc/passwd | cut -d':' -f1,6); do
	usuario=$(echo $usuarios | cut -d: -f1)
	home=$(echo $usuarios | cut -d: -f2)
	cantidad=$(find $home -type f -name "*$exten" 2>/dev/null | wc -l )
	echo -e "$usuario\t$cantidad\n" >> $reporte
done


