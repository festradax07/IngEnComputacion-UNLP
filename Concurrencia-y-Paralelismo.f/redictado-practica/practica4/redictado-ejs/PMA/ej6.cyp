En una muestra de autos hay 5 simuladores para ser usados por N personas que asisten al evento. Hay un empleado que se encarga de administrar el uso de los mismos respetando el orden de llegada. Cuando una persona quiere usar un simulador debe esperar a que el empleado le indique uno LIBRE al cual ir, lo usa y luego le avisa al empleado que termino de usarlo. Nota: maximizar la concurrencia; suponga que hay una funcion Usar(IdSim) llamada por las personas que simula el uso del simulador IdSim; todos los procesos deben terminar.

chan linkEmpleado; // n personas  -> empleado
chan termine(int);

process Persona[id:0..N-1]{
	int idS;
	send linkEmpleado(id);
	receive respuesta[id](idS);
	Usar(idS);
	send termine(idS);

}

process Empleado{
int idP, ok;
boolean simulador[5]
	while(true){ // no aviso porque debo estar liberando cuando sea necesario
		if(not empty(simulador) && (not empty (linkEmpleado) )-> {receive linkEmpleado(idP); 
						idS=obtenerLibre(simulador); // ke da el sim libre
						send respuesta[idP](idS);}
		[] not empty (termine) -> {receive termine(idS); simulador[IdS]=TRUE;}

	}
}
