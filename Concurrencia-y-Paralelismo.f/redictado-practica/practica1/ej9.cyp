
boolean atendidos[25] =(false)
listo=false; ok=false; // verifica que la charla arranque cuando el jugador esté frente al entrenador
proceso Jugador [id:0..25]{
	<await turnoact==id>;
		ok=true;
		//habla con el entrenador
		<await listo>; listo=false;
		Correr30(); // este proceso es individual, no hace falta protegerlo.

}
proceso Entrenador{
	idact=-1;
	for(i=0..24){
		turnoact=Siguiente()
		<await ok>; ok =false;
		//habla con el jugador;
		Listo=true;
		<await(not listo)>; // aseguro que el jugador se fué, colocando en false el listo.
	}
}
