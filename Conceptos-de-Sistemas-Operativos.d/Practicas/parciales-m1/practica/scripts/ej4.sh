#!/bin/bash
#
if [ $# -lt 2 ]; then
	echo "error! parametros incorrectos! se necesita una fecha y una direccion ip"
	exit 1
fi

ips=($*)
fecha=${ips[0]}
unset ips[0]
ips=("${ips[@]}")
if [ -f /var/log/access."$fecha".log ]; then  
	for ip in ${ips[@]}; do
		cantidad=$(grep "^$ip" /var/log/access."$fecha".log | wc -l )
		echo " $ip	||	$cantidad " >> reporte.txt
	done
else
	echo "error! no existe archivo log para esa fecha."
	exit 2
fi

