4) existen N personas que deben imprimir un trabajo cada una.
a)Implemente una solucion suponiendo que existe una unica impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar el orden. Existe una funcion Imprimir(doc) llamada por la persona que simula el uso de la impresora. Solo se deben usar los procesos que representan a las Personas.

Impresora imp;
bool libre=true;

Process Persona [id:0..N-1]{
	Documento d;
	<await(libre);libre=false>;
	Imprimir(imp,d);
	<libre=true>;
}

b) RESPETANDO EL ORDEN DE LLEGADA
Queue cola;
int siguiente=-1;
Impresora imp;

Process Persona[id:0..N-1]{
	Documento d;
	<if(siguiente=-1) siguiente= id
	else Push(cola,id)> //duda sobre volver atomicos los if
	<await(siguiente==id)>
	Imprimir(imp,d);
	<if(empty(cola)) Siguiente=-1
	else siguiente= Pop(cola)>
}
c) dandoPrioridad por edad, lo mismo pero la cola debe tener logica para priorizar edad (abstraccion)
QueueEspecial cola;
int siguiente=-1;
Impresora imp;

Process Persona[id:0..N-1]{
	Documento d;
	<if(siguiente=-1) siguiente= id
	else Push(cola,edad,id)> // al pushear internamiente la cola me prioriza si soy mayor
	<await(siguiente==id)>
	Imprimir(imp,d);
	<if(empty(cola)) Siguiente=-1
	else siguiente= Pop(cola)>
}
d)
int siguiente=0;
Impresora imp;

Process Persona[id:0..N-1]{
	Documento d;
	<await(siguiente==id)>
	Imprimir(imp,d);
	<siguiente=siguiente+1>
}

e)


QueueEspecial cola;
int siguiente=-1;
bool libre=true;
Impresora imp;

Process Persona[id:0..N-1]{
	Documento d;
	<Push(cola,edad,id)> // al pushear internamiente la cola me prioriza si soy mayor
	<await(siguiente==id)>
	Imprimir(imp,d);
	<libre=true>;
}

Process Coordinador{
	while true {
		<await(!empty(cola)&& libre);
		siguiente=pop(cola);libre=false> //consultar atomicidad y uso de varias sentencias en await, además del uso de la var libre);
	}
}
