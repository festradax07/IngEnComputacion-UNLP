# !/bin/bash
 if [ -z "$1" ]; then
 	echo "error! no sé envió el nombre de usuario como parametro"
 	exit 1
 fi

 while true; do
	 if who | grep -q "^$1"; then
		 echo "el usuario está logeado actualmente"
		 break
	 else
	     echo "$1 todavia no se logueo! "
	     sleep 10
	 fi
  done
