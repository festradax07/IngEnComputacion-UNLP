Recurso cola[5] =(REC1,REC2,REC3,REC4,REC5)
// cuando un proceso necesita usar una instancia la saca, la usa y la vuelve a depositar
process proceso[id:0..N]{
	Recurso recurso;
	<!empty(cola);pop(cola,recurso)>
		//utilizo el recurso
	<push(cola,recurso)>

}
