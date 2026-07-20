4. En cada ítem debe realizar una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) para el siguiente problema, teniendo en cuenta las condiciones indicadas en el item. Existen N personas que deben imprimir un trabajo cada una. 
a) Implemente una solución suponiendo que existe una única impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar el orden. Existe una función Imprimir(documento) llamada por la persona que simula el uso de la impresora. Sólo se deben usar los procesos que representan a las Personas.
// impresora recurso compartido
Impresora imp
bool enUso=false

process Persona[id:0..N-1]{
	Documento doc;
	<Await(not enUso),enUso=true>
	Imprimir(doc,imp);
	enUso=false // consultar por atomicidad de la asignacion

}

b) Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada.
Impresora imp;
int siguiente=-1;
cola C;
process Persona[id:0..N-1]{
        Documento doc;
	<if(Siguiente=-1)Siguiente=id; // si está vacia me coloco primero.
	else Agregar(C,id)>; // sino, me encolo.
        <Await(siguiente==id)>
        Imprimir(doc,imp);
        <if (empty(C)) siguiente =-1
	 else siguiente=Sacar(C);>// si la cola está vacia dejo siguiente en -1 sino siguiente obtiene el id proximo de la cola.

}


c) Modifique la solución de (b) para el caso en que se deba respetar el orden de llegada pero dando prioridad de acuerdo a la edad de cada persona (cuando la impresora está libre la debe usar la persona de mayor edad entre las que hayan solicitado su uso). 
 // se le agrega a la cola un criterio de prioridad al agregar personas de mayor edad cola -> colaEspecial

d) Modifique la solución de (a) para el caso en que se deba respetar estrictamente el orden dado por el identificador del proceso (la persona X no puede usar la impresora hasta que no haya terminado de usarla la persona X-1). 
Impresora imp
int  siguiente=0 // debe iniciar en 0 para que haya por lo menos un proceso que si se inicie

process Persona[id:0..N-1]{
        Documento doc;
        <Await(siguiente==id)>
        Imprimir(doc,imp);
        siguiente = siguiente + 1;

}

e) Modifique la solución de (c) para el caso en que además hay un proceso Coordinador que le indica a cada persona cuando puede usar la impresora. 
Impresora imp;
int siguiente=-1;
cola C;
bool Listo = false;

process Persona[id:0..N-1]{
        Documento doc;int edad=...;
        <Agregar(C,edad,id)>;
        <Await(siguiente==id)>
        Imprimir(doc,imp);
        <await(Listo);Listo=false>
}
process Impresora{

<await(!empty(C))> // por si se inicia el proceso sin valores en el recurso compartido
while(!empty(c)) do{
	siguiente=Sacar(c);
	Listo = true;
	<await(not Listo)>;} 
siguiente=-1;
}
