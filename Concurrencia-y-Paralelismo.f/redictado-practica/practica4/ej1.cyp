chan Solicitudes(int);
chan Pedidos(int);
chan Siguiente[2](int);
chan respuesta[n](texto);

proceso Persona [id:0..n-1]{
	texto res; 
		send Solicitudes(id)
		receive Respuesta[id](res)


}
proceso coordinador{
int idP,idE;
while(true){
	receive pedidos(idE);
	if(empty(Solicitudes))idP = -1;
	else receive Solicitudes(idP)
	send Siguiente[idE](idP):
}

}

proceso Empleado[id:0..1]{
	int idP;texto Res;
	while true{
		send Pedidos(id);
		receive Siguiente[id](idP);
		if(idp<>-1){ DarRespuesta(Res);send Respuesta[idp](Res)}


	}

}
