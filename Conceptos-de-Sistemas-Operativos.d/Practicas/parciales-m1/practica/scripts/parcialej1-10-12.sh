#!/bin/bash
ubicacion= $(find / -type d -name "$1" 2> /dev/null)
contador=0
if echo "$ubicacion" | grep -q .; then
	for archivo in $ubicacion; do
		if [! -d $archivo ]; then
			if [ -r "$archivo" ] && [ -w "$archivo" ]; then
				((contador++))
			fi
		fi
	done
	echo "$contador"
else
	exit 4
fi

