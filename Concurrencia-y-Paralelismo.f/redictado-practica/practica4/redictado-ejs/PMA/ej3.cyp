En una oficina hay un empleado para atender a N personas. Las personas pueden tener prioridad ALTA o BAJA (cada uno conoce su prioridad). El empleado atiende a las personas de acuerdo a la prioridad. Cada persona espera hasta que el empleado lo termina de atender y se retira. Nota: no debe hacerse Busy Waiting.

chan linkPersonasAlta // persona-> empleado
chan linkPersonaBaja // persona -> empleado
chan LinkRespuesta[N] /// empleado -> persona
chan avisar(int) // avisa si hay una persona esperando

process Persona[id:00..N-1]{

	int prioridad= definirPrioridad() // 1 = ALTA 0 = BAAJA
	if( prioridad == 1) linkPersonasAlta(id);
	else linkPersonasBaja(id);
	avisar(1);
	receive LinkRespuesta[id]
}

process Empleado {

int idP,ok;
while(true){
	receive avisar(ok);
	if ( not empty(linkPersonasAltas)) -> receive linkPersonasAltas(idP);
	[] (empty (linkPersonasAltas)) && (not empty(linkPersonasBajas))--> receive linkPersonasAltas(idP);
	fi
	atendiendo(idP);
	send linkRespuesta(idP);
}

}
