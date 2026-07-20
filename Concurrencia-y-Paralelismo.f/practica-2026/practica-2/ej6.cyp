# N personas deben fotocopiar un documento cada una.
#
#a - supongamos hay una unica fotocopiadora para n personas, la deben usar de a una persona a la vez, sin orden. Ftotocopiar() hace uso de la fotocopiadora. Solo con procesos de personas.
#
sem mutex=1; // reservado para el recurso compartido
procedure Persona[id=0..N-1]{
	P(mutex); // la que encuentre el mutex disponible entra y fotocopia
	Fotocopiar();
	V(mutex); // liberan mutex


}
i
#b - modifica para que se deba respetar el orden de llegada
sem mutex=1;
sem mutex_impresora=1;
bool imprimiendo= false;
sem turno[N]=([N] 0)
Cola c;
int siguiente=-1;
procedure Persona[id=0..N-1]{
	P(mutex);
	if(c.empty() && !imprimiendo){
		imprimiendo= true;
		siguiente= id; // cola vacia, voy yo
		V(turno[siguiente]);
	else c.enqueue(id); // me encolo, espero mi turno
	V(mutex);
	
	P(turno[id]);
	P(mutex_impresora);
	Fotocopiar();
	V(mutex_impresora);
	imprimiendo=false;


	P(mutex)
	if(!c.empty()){
		siguiente= c.dequeue();
		V(turno[siguiente]);
	}
	V(mutex)

}

#c - lo mismo pero cambio el proceso de encolado por uno que reciba la edad tambien
#d - se debe respetar el orden numerado
#
sem mutex=1;
int siguiente=0;
sem turno[N]= ([N] 0)
process Persona[id=0..N-1]{
	if( id==0){
		V(turno[id]);
	}
	P(turno[id])
	Fotocopiar()
	if(id+1 < N){ 
		V(turno[id+1]);
	}

}
#e - Empleado indiica a cada persona cuando usar la fotocopiadora.
#
sem mutex=1;
sem mutex_impresora=1;
sem turno[N]=([N] 0)
Cola c;
int siguiente=-1;
procedure Persona[id=0..N-1]{
	P(mutex);
	c.enqueue(id); // me encolo, espero mi turno
	V(mutex);
	V(pedido); // indico que hay por lo menos algo en la cola
	
	P(turno[id]); // espero mi turno
	P(mutex_impresora); // DUDA: EN ESTE CASO NO DEBERIA TENER UN MUTEX IMPRESORA, porque si o si estoy condicionado por mi turno.
	Fotocopiar(); // imprimo
	V(mutex_impresora);


}
process Empleado{
   while(true){
   	P(pedido);
   	P(mutex);
		siguiente= c.dequeue();
		V(turno[siguiente]);
	V(mutex);
	}
  }
}

f)
sem mutex=1; 
sem pedido=0;
sem cantfotocopiadora=10; // fotocopiadoras disponibles
sem turno[N]=([N] 0)

Cola fotocopiadoras;
Cola c;
int nro_fotocopiadora[N]; // para las personas

procedure Persona[id=0..N-1]{
	P(mutex);
	c.enqueue(id); // me encolo
	V(mutex);
	V(pedido);

	P(turno[id]);   // el empleado me habilita
	
	int maquina= nro_fotocopiadora[id];

	Fotocopiar(maquina); // asumamos que fotocopiar necesita el num de la fotocopiadora
	P(mutex)
	fotocopiadora.enqueue(maquina);
	V(mutex);
	V(cantfotocopiadora); // aumento la cantidad de disponibles
}

process Empleado{
   while(true){
   	P(pedido);
	
	P(cantfotocopiadora) // hay disponible?
	
	P(mutex);
		int siguiente = c.dequeue();
		int maquina = fotocopiadora.dequeue();
		nro_fotocopiadora[N] = maquina;
	V(mutex);

	V(turno[siguiente]);
   }
}
