#!/bin/bash
#
#
echo "elije una opcion DondeEstoy, QuienEsta, Listar o Salir"
select opcion in "DondeEstoy" "QuienEsta" "Listar" "Salir"; do 
	case $opcion in 
		"DondeEstoy") echo $(pwd);;
		"Listar") echo $(ls);;
		"QuienEsta") echo $(who);;
		"Salir") echo "script finalizado";
			break;;
		*) echo "opcion no valida)";;
	esac
done

