process CLiente[id:0..N-1]{
	AdminOrden!cargar(id);
	Empleado?finCarga();

}
process AdminOrden{
cola buffer;
int idC;
	do Cliente[*]?cargar(idC) --> {push(cola,idC}
	[] not empty (buffer); Empleado?hayPedido(idE) -->{pop (cola,idC); Empleado!atender(idC)}
	od
}
process Empleado{
	int idC;
	while(true){
		AdminOrden!haypedido();
		AdminOrden?atender(idC);
		carga()
		Empleado[idC]!finCarga();

	}

}
