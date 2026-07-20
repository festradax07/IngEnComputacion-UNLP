
int presentes=0;
boolean entregado[45]=(false)
Parcial entrega[45];
cola entregas;
int nota[45]=(0)

proceso preceptor{
<await presentes==45>
for (i=0..44){
	entrega[i]=darParcial() // se asume que se le da el parcial con este metodo al alumno
	entregado[i]=true;
}


}

proceso profesora{
	Parcial act;int idact;
	for (i=0..44){
		<await (!isEmpty(entregas));Pop(entregas,act,idact)>;
		nota[idact]=corregirExamen(act);
	}


}


proceso alumno[id:0..44]{
	int resultado;
	<presentes++> // debe ser manipulada con exclusión mutua, ya que puede pasar que dos procesos quieran usar el mismo recurso.
	<await entregado[id]>
	HacerExamen(entrega[id]) // realizo el examen
	<Push(entregas,entrega[id],id)> envio a la cola, el examen realizado con exclusión mutua.
	<await (nota[id] !=0);resultado=nota[id]>


}
