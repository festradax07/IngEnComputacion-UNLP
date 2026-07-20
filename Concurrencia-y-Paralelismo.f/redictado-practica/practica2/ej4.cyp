sem mutex_cola=1;
sem turno[id]=([N] 0)
sem mutex_micros[N]=([N] 25);
int solicitudmicro[N]=[N]
boolean listo=false;
process persona[id:0..N]{
	P(mutex_cola);
	enqueue(c,id);
	V(mutex_cola);
	v(solicitudes);
	P(turno[id]);
	solicitudMicro[id];
	V(Listo);
	
}

process empleado{

	while(true){
		P(solicitudes);
		P(mutex_cola);
		siguiente=dequeue(c);
		V(mutex_cola);
		V(turno[siguiente])
		P(listo)
		if(solicitudmicro[siguiente] < 4){
			V(mutex_micros[solicitudMicro[siguiente]]);	
		}
		
	}
}
process micro[id:0..3]{
	while(true){
		if (mutex_micros[id] == 25){
			RealizarViaje();
	}
}

// version mejorada
int k=4;
int ASIENTOS=25;
int N=...;

Cola c;
sem mutex_c=1;
// handshake vendedor <-> persona
sem turno[N]=([N] 0); // vendedor habilita el turno de venta
sem pedido_listo[N] = ([N] 0 ) // persona informa al vendedor su pedido
sem ticket_listo[N]= ([N] 0) // vendedor informa el resultado del ticket

int deseo[N];
bool ticket[N] = {false} // ticket afirmativo 

int asientos[K] = {ASIENTOS,ASIENTOS,ASIENTOS,ASIENTOS}
int abordar[K]= {0,0,0,0}
sem mutex_abordar[K]={1,1,1,1}
sem todos_abordo[K]={0};
sem llegada[K]{0}

process Persona[id:0..N-1]{
	P(mutex_c);
		enqueue(q,id),
	v(mutex_c);

	p(turno[id]); // esperando que le habiliten el turno con el empleado

	// avanzo
	int k = elegirCombi(); // 0..k-1
	deseo[id]=k;
	v(pedido_listo[id]); // aviso al vendedor qué combi quiero.

	// resultado
	P(ticket_listo[id]);
	if(ticket[id]){
			P(mutex_abordar[K]);
				abordar[K]++;
				if(abordar[K] == ASIENTOS) -> V(todos-abordo[K])
			V(mutex_abordar[K]);

			P(LLEGADA[K])
			//bajo del micro

	}
	// fin
}

process empleado{
	while ( true){
		P(mutex_c);
			siguiente = dequeue(c):
			V(turno[siguiente]);
		v(mutex_c);

		// espero a que me digan que combi quieren
		P(pedido_listo[siguiente]);
		int k = deseo[siguiente];

		// intento vedner solo el empleado toca seats [K]
		if (asientos[K] > 0){
			asientos[K]--; // si todavia hay asiento, ocupo uno.
			ticket[N]= true;
		}
		v(ticket_listo[siguiente]);
	}	
		

}

process Micro[id:0..K-1]{
	P(todos_abordo[id]);
	viajar(k);
	for(i=0;i<ASIENTOS;i++)V(llegada[K]);

}

