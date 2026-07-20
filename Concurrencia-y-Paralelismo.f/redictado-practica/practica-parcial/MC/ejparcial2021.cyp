
bool turno[N]=([N]false);
int turnoid=0;
bool listo=false;
bool

process pacientes[id:0..n-1]{
	// asumimos que su turno es su id (1..30)
	<await id == turnoid> // es mi turno, muy seguro
	turno[id]=true; // llegué
	<await listo=true> // me atendieron
	listo =false; // me fui
	
}

process enfermera {
int 
for i=1..30 do {
	<await turno[i]> // legó paciente
	vacunar(); //vacuno
	listo=true; //terminamos
	<await listo=false> // espero a que se vaya

}

}

######SEMAFOROS###########
--------------------------

sem turno[N]= ([N]0); // usaremos turno como un validador en vez de un llegue
sem llegue[N] = ([N]0);
sem listo = 0;

process pacientes[id:0..N-1]{
	P(turno[id]) // espero a que me llamen
	V(llegue[id]) // legué
	P(listo) // que me digan que me bachaa
	V(listo)// me jui

}

process enfermera{
	for i=0..29 do {
		V(turno[i]);
		P(llegue[i]);
		vacunar();
		v(listo);
		p(pacientefuera);// espero a que se vaya

	}
	
}

########MONITORES##########
----------------------------


MONITOR CONSULTORIO{
	TURNOID=0;
	cond turnos[30];

	procedure llegada(id:in int){
		if(turnoact!=id){
			wait(turno[id]);
		}
	}
	procedure siguiente(){
		if(turnoid <30){
			signal(turno[turnoid]);
			turnoid++;
		}
	}


}

process pacientes[id:0..29]{

	Consultorio.llegada(id);
	vacunar();
	consultorio.siguiente();
}
