// N CLIENTES COLA DE UN BANCO, ATENDIDOS POR EMPLEADOS.
 N CLIENTES - M EMPLEADOS, canal de cola, canal privado para avisarles que ya se pueden retirar

a) 
chan cola(turno);
chan terminar[N](int);

Process Persona[id:0..N-1]{
int ok;
//llego
send cola(id);
receive terminar[id](ok);
// me voy
}

Process Empleado{
int idP;
while(true){
	receive cola(idP);
	atender(idP);
	send terminar[idP](1);
}
}

b) no hay que modificarse nada, es valida de igual forma

c) al tener mas de uno y estar consultando si la cola esta vacia puedo generar 
demora innecesaria en uno de los procesos empleado.
Para eso utilizo un coordinador que verifique la cola y distribuya la carga a cada uno de ellos sin pisarse.

chan cola(turno);
chan terminar[N](int);
chan pedidos(int idE);
chan siguiente [2](int);

Process Persona[id:0..N-1]{
int ok;
//llego
send cola(id);
receive terminar[id](ok);
// me voy
}

Process Coordinador{
int idE, turno;

while (true){
	receive pedidos(idE);
	if(empty(cola)) turno=-1;
	else receive cola (turno);
	send siguiente[idE](turno);
}

}

Process Empleado[id:0..1]{
int idP;
while(true){
	send pedido(id);
	receive siguiente[id](idP);
	if (idP <> -1){
		atender(idP);
		send terminar[idP](1);
	}else delay(900);
}
}
