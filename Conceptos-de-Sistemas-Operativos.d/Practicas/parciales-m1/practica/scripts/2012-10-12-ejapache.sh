#!/bin/bash
ejecutado=0;
proceso=apache
while [ $ejecutado -lt 10 ]; do
	if ps aux | grep -v grep | grep "$proceso" > /dev/null; then
		((ejecutado++))
	fi
	sleep 1
done
kill $(ps aux | grep -v grep | grep "$proceso" | awk '{print $2}')
echo "proceso $proceso terminado ya que fue ejecutado "$ejecutado" veces"
exit 50
