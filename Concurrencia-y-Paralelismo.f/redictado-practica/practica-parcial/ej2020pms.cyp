process Corredor[id:0--2]{
	Administrador!llegada(id);
	Coordinador[*]?darChaleco(numChaleco);
	Inicializador!listo();
	Inicializador?empezar();
	correr();
	Meta!termine(id);
	Meta?tuPosicion(id);
}
process Administrador{
	cola buffer;
	int idC, idE;

	do Corredor[*]?llegada(idC) --> push (buffer,idC);
	[] not empty(buffer); Coordinador[*]?hayPedido(idE) --> pop (buffer, idC); coordinador[idE]!tomarPedido(idC);
	od

}

process Meta{
	int idC,pos=0;
	for (i=0..C) do{
		Corredor[*]?termine(idC);
		pos++;
		Corredor[idC]!tuPosicion(pos);


	}


}
process Inicializador{
	for(i=0;i<C;i++)Corredor[*]?listo();
	for(i=0;i<C;i++)Corredor[*]!empezar();
}

process Coordinador[id:0..2]{

while(true){
	Administrador!hayPedido(id);
	Administrador?tomarPedido(idC);
	numchaleco= darNumchaleco(); // retorna valor int
	Corredor[idC]!darChaelco(numchaleco);

}

}
