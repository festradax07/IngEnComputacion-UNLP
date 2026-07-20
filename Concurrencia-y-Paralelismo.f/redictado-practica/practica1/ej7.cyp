UNA EMPRESA DE TURISMO POSEE UN MICRO CON CAPACIDAD PARA 50 PERSONAS. Hay un unico vendedor donde C pasajeros (C>50) intentan comprar un pasaje de acuerdo al orden de llegada) si aún hay lugar se dirige al micro para subir; en caso contrario se retira. El micro espera a que suban los 50 pasajeros( suben de a uno y sin importar el ordern), luego realiza el viaje, y cuando llega al destino deja bajar a todos los pasajeros.

int CANTASIENTOS=50;
int C=70;
bool listo[C]={false}
bool boleto[C]={false}
Cola cola;
int siguiente=-1;

process Pasajero[id:0..C-1]{
	<agregar(cola,id)>
	<Await(listo[id])>
	if(boleto[id]==true){ 
		<abordar++>
		<await(llegar)>
		//llegué al destino
	}
}
process Vendedor{
int siguiente;
while(true) do{
	if(notempty(cola)){ 
		<Siguiente=Sacar(cola)>
		if(cantAsientos>0) {
			cantasientos--;
			boleto[siguiente]=true;}
		listo[siguiente]=true;
	}
	
}
process Micro{
	//aguardar a cantasientos=0
	//LLEGAR=TRUE;
}
