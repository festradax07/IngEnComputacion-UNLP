// turismo 4 combis (25 personas cada na); vendedor (vende pasajes a los clientes por orden de llegada) (proceso). C clientes que al llegar intentan comprar un pasaje para una combi en particular (el cliente conoce este dato); si aun hay lugar en la combi se le da el pasaje y se dirige hacia la combi; en caso contrario se retira. la combi espera a que suban los 25 pasajeros, luego realiza el viaje, y cuando llega, baja a todos los pasajeros.para cada combi Al menos 25 clientes intentarán comprar pasaje.



//mgmt_cliente
sem mutex_vendedor=1;
sem pedido=0;
sem turno_atendido[C]=([C] 0)
int solicitud[C]; // para comunicarle que combi quiere
sem esperar_respuesta[C]=([C] 0)
sem avisar_vendedor[id]
int respuesta[C]=([C] false)
//mgmt_vendedor
Cola cola;
sem turno=0;
//mgmt_combi
int disponibles[4]=([4]25)
sem bajarme=([4]0)
sem lleno[4]=([4]0)
sem llegue[4]=([4]0)




proceso cliente[id:0..c-1]{
	P(mutex_vendedor)
	push(cola,id)
	v(mutex_vendedor)
	V(pedido)
	P(turno_atendido[id])
	idCombi= PedirAsientoEncombi() // devuelve el id
	solicitud[id]=idCombi;
	V(avisar_vendedor[id]);
	P(esperar_respuesta[id])
	if(respuesta[id]){
		if(disponibles[idCombi]==0) -> V(lleno[idCombi]); // fui el ultimo, entonces pedí que arranquemos
		P(llegué[idCombi])
		v(bajarme[idCombi]) // semaforo para indicar que me bajé
	}
}

proceso vendedor{

while(true){
	P(pedido) // cuando alguien haga una solicitud, sé que hay en la cola para actuar
	P(mutex_vendedor)
	Pop(cola, idCliente)
	V(mutex_vendedor)
	V(turno_atendido[idCliente])
	P(avisar_vendedor[idCliente]) // espero a que me den la petición
	if(disponibles[solicitud[id]] > 0) ->{disponibles[solicitud[id]]--; respuesta[idCliente]=true;}
	V(esperar_respuesta[idCliente])
}
}

proceso combi[id:0..3]{
while(true){
	P(lleno[id])
	Viajar()// metodo para arrancar
	for i=1..25 -> V(llegué[id])
	for i=1..25 -> P(bajarme[id])
}

}
