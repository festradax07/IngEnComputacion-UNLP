#!/bin/bash 
if [ $# -eq 0 ]; then 
        echo "error! debe enviar al menos un parametro" 
        exit 1  
fi 
# cada parametro la ruta absoluta (desde root)  
archivos=("$@") 
file_non_exist=0 
directory_non_exist=0 
for posicion in ${!archivos[@]}; do  
        if [ $(($posicion % 2)) -ne 0 ]; then # cambiar el orden de los if si es que debo ver que todas las rutas existan, ya que solo estoy cuantificando las impares. 
               if [ -e ${archivos[$posicion]} ]; then 
                        if [ -f  "${archivos[$posicion]}" ]; then 
                                echo " la ruta pertenece a un archivo" 
			elif [ -d "${archivos[$posicion]}" ]; then
                                echo " la ruta pertenece a un directorio" 
                        fi 
                else 
                        if echo "${archivos[$posicion]}" | grep -q "\."; then 
                                ((file_non_exist++)) 
                        else 
                                ((directory_non_exist++)) 
                        fi               
               fi 
        fi 
done     
echo " cantidad de rutas de archivos inexistentes "$file_non_exist" \n cantidad de rutas de directorios inexistentes "$directory_non_exist" "

