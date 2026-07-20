N PERSONAS FOTOCOPIAR UN DOCUMENTO.

A) 1 fotocopiadora x n personas, de a uno, sin orden. 
como no hay orden, con la exclusion mutua es suficiente.

Process Persona[id:0..n-1]{
	Fotocopiadora.usar();
}
Monitor Fotocopiadora{
	process usar(doc:in text){
		Fotocopiar(doc);
	}
}

B) respetar orden de llegada:

Process Persona[id:0..N-q]{

	Fotocopiadora.Llegada();
	Fotocopiar(doc);
	Fotocopiadora.Salida();

}
Monitor Fotocopiadora{
	cond esperar;
	int esperando=0;
	bool libre=true;
	process Llegada(){
		if(not libre){ esperando++;
				wait(esperar)
		}else{ libre=false}
	}
	process Salida(){

		if( esperando >0){ esperando--; signal(esperar) }
		else libre=true;

	}
}
C) dar prioridad por edad de cada persona (cuando esté libre la debe usar la persona de mayor edad entre las que estén esperando para usarla)
// cambian dos cosas, el orden de las cond va a ser distinto al orden encolado, por lo que una cond individual ya no me sirve. Voy a usar un array de cond donde el indice sea el id de la persona y una cola (ds) para conseguirla y ordenarla por el criterio con un insertarPrioridad.

Process persona // igual a b

Monitor Fotocopiadora(){
	ColaPrioridad c; // recibe id + edad
	bool libre=true;
	int esperando=0;
	cond esperar[N];

	procedure Llegada(id,edad:in int){
		if(not libre){ esperando++;
				InsertarPrioridad(c,(id,edad));
				wait(esperar[id]);
		}else{libre=false}

	}

	procedure Salida(){
		Int id;
		if( esperando >0){ esperando--; id=pop(c); signal(esperar[id])}
		else{ libre=true;}
	}

}

D) modificar a para que sea por id ordenado.


Process Persona[id:0..n-1]{
	Fotocopiadora.llegada()
	Fotocopiar(doc);
	Fotocopiadora.Salida();
}
Monitor Fotocopiadora{
	int next=0;
	cond esperar[N];
	procedure llegada(id:in int){
		if(next!=id){
			wait(esperar[id])
		}
	}
	procedure Salida(){
	next++;
	if (next<N){
		signal(esperar[next]);
	}
	
	}
}

e) Modificar b para el caso en que haya un Empleado que le indica a cada persona cuando debe usar la fotocopiadora.
// persona igual

Process Empleado{
	while(true){
		Fotocopiadora.proximo();
		
	}

}

Monitor Fotocopiadora{
	Cola c; 
	cond esperar, atencion,salida; // en este caso no hace falta array de esperar porque se utiliza el orden de llegada, el mismo encolado que usa el cond
	procedure Llegada(){
		Push (c,id);
		signal(atencion)
		wait(esperar)
	}
	procedure proximo(){
		int id;
		if(empty(cola)) -> wait(atencion)
		Pop(c,id);
		signal(esperar)
		wait(salida)

	}
	procedure Salida(){

		signal(salida)

	}
}

f) son 10 fotocopiadoras, y el empleado indica a cual puede usar (mayor complejidad)

¿como ordeno a los clientes?
- necesito los recursos libres cuantificables para un passing the condition.- una cola con los ids de fotocopiadoras libres.
process persona[N]{
	Admin.Llegada(idF);
	Monitor[idF].usar(doc)
	Admin.Salida(idF);
}

process Empleado{
	while(true){
	   Admin.proximo();
	}
}

Monitor Admin{
	int res;
	Cola c;
	cola flibres;
	int esperando=0;cantlibres=0;
	cond esperar, atencion,salida; // en este caso no hace falta array de esperar porque se utiliza el orden de llegada, el mismo encolado que usa el cond
	procedure Llegada(idF:out int ){
		Push (c,id);
		signal(atencion)
		wait(esperar)
		idF=Res:
	}
	procedure proximo(){
		int id;
		if(empty(c)) -> wait(atencion)
		if (cantlibres==0){ esperando++; wait(esperarF)}
		else cantlibres--;
		Res=Pop(flibres,id);
		signal(esperar)

	}
	procedure Salida(idF: in int){
		push(flibres,idF);
		if( esperando > 0){ esperando--;signal(esperarF)}
		else cantlibres++;

	}
}
Monitor Fotocopiadora[id:0..9]{
	procedure Usar(doc:in int ){
		Fotocopiar(doc)
	}
}
NOTA A MEJORAR: SI UTILIZO UN CRITERIO DE ORDEN DE LLEGADA EN MONITORES, NO NECESITO UNA COLA PARA LAS PERSONAS, CON EL PROPIO COND SE ARREGLO.
