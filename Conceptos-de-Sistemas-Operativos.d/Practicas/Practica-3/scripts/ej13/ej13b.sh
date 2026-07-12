echo "esciba una opcion -listar -dondeEstoy - quienEsta"
read opcion
case $opcion in 
"listar")
	ls
	;;
"dondeEstoy")
	pwd
	;;
"quienEsta")
	who
	;;	
*)
	echo "Error!opcion invalida!"
	;;
esac
