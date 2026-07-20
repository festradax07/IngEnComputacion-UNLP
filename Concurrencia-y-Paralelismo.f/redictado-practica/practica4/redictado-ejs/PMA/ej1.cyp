chan Solicitudes(int); // canal de solicitudes entrantes
chan liberar(int,int); // forma de avisar que un 
chan Siguiente[5](int); // cola de las 5 cajas
chan respuesta[n](texto); // canales de respuesta para cada persona

proceso Persona [id:0..n-1]{
	texto res; 
		send Solicitudes(id)
		receive Respuesta[id](res)


}
proceso coordinador{
vcontador[5]=([5] 0)
int idP,idC;
while(true){
	do (not empty(Solicitudes)) -> {receive Solicitudes(idP)
			idC= min(vcontador); // devuelve el id de la caja minima.
			send Siguiente[idC](idP);
			vcontador[idC]++;}
	[] (not empty(Liberar)) -> {receive Liberar(idC,idP); vcontador[idC]--; send Respuesta[idP]("Exito")
}

}

proceso Caja[id:0..4]{
	int idP;
	while true{
		receive Siguiente[id](idP);
		if(idp<>-1){ AtenderPersona(idP);send Liberar(id,idp)}

	}

}
