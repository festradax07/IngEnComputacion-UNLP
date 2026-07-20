chan linkAdmin(int,texto) //(id,accion) persona/s -->admin
chan linkEMpleados[3] //(id,accion) admin -->empleados
chan respuesta[P](texto) // empleados --> persona
chan hayPedido(int);

process Persona[id:0..P-1]{
	accion = darAccion();
	send linkAdmin(id,accion);
	receive respuesta[id](res);
	
}
process empleados[id:0..2]{
send haypedido(id)
receive linkEmpleados(idP,accion);
while(IDP !=-1){
if(idp>0){
	respuesta= resolverTamite(accion);
	send respuesta[idP](respuesta);
}esle delay (300.00)
send haypedido(id);
receiveLinkEmpleados(idP,accion);
}

}
process Admin{
cantatendidos=0;
while(cantatendidos <P){
	receive haypedido(idE);
	if (not empty(LinAdmin)) --> {receive linkAdmin(idP,accion); send linkEmpleados[idE](idP,accion); cant++ }
	else idp=0;


}
for (i=0;i<3;i++)
receive haypedido(idE);
send LinkEmpleados[idE](-1,"VACIO")
}
