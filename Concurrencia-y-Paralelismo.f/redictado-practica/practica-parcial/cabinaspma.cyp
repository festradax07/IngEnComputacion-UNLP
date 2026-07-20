##version sin bW
chan solicitar(int,int,text);
chan usarCabina[N](int);
chan irse[N]();


Process Cliente[id:0..N-1]{
int numC;
send solicitar(id,NULL, "pedir");
receive usarCabina[id](numC);
UsarCabina();
send solicitar(id,numC, "liberar");
receive irse[id]();
}

Process Empleado {
int idC, numC, i, idAux;
text op;
cola libres, colaPed;

for(i=1;i<11;i++)push (libres,i); // coloco las 10 cabinas
while(true){
	receive solicitar(idC,numC,op);
	if(op=="liberar"){
		Cobrar(numC,idC); // le cobro por la cabina al cliente
		send irse[idC](); // le envio para que se vaya
		if( empty(colaPed)) push (libres,numC); // si no hay ningun pedido actualmente, me guardo la cabina
		else{
			pop (colaPed,idAux); // sino, saco un pedido
			send usarCabina[idAux](numC); // le doy la cabina actual al que solicitó
		}
	}else if( empty(libres) or not empty (colaPed)) push (colaPed, idC) // si están ocupadas las cabinas o hay pedidos, lo pongo en waiting
	else{
		pop (libres,numC); // saco una cabina y se la mando
		send usarCabina[idC](Numc);
	}


}


}
