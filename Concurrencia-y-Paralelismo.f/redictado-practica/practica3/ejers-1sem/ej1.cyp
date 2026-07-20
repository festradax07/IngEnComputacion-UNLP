
Process Lector{
	Bd.Llegada();
	Leer();
	Bd.Salida();
}


Monitor Bd{
int contador=0;
cond espera;
int esperando=0;
Process Llegada(){
	if (contador==5){
		esperando++;
		wait(espera)
	}else{
		contador++; // seria sumarme a leer
	}
}
Process Salida(){
	if(esperando >0){ // si hay consumers esperando
		esperando--;
		signal(espera); // pasan a ser los siguientes
	}else{contador--;} // si no hay nadie esperando, puedo bajar el contador.

}


}
