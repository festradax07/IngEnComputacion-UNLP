Resolver la administración de las impresoras de una oficina. Hay 3 impresoras, N usuarios y 1 director. Los usuarios y el director están continuamente trabajando y cada tanto envían documentos a imprimir. Cada impresora, cuando esta libre, toma un documento y lo imprime, de acuerdo al orden de llegada, pero siempre dando prioridad a los pedidos del Director. Nota: los usuarios y el director no deben esperar a que se imprima el documento.

chan Linkimpresoras[3]; // 3 impresoras 
chan linkDirector; // direc --> coordinador
chan linkUser; // usuarios -->Coordinador
chan hayDocs // Imprs --> Coordinador

process Usuario [id:0--N-1]{
TEXT docu;
while(true){ // flujo eterno de trabajo
	doc= generarDoc();
	send linkUser(doc) // no hace falta enviar mi id porque no me piden devolverle mi trabajo, en tal caso, debe haber un canal privado contra los n usuarios

}


}

process Director{

// lo mismo pero con linkDirector
}

process Coordinador{
text Doc; int idImp;
while(true){
	doc= "VACIO" // VALOR DEFAULT CADA VUELTA HASTA REGISTRAR UN DOC, EN CASO DE ESTAR SIN DATOS.
	receive HayDocs(idImp) // me permite esperar sin busy wainting
	// reviso los canales
	if (not empty (linkDirector)) -> receive linkDirector(Doc);
	// agarra con prioridad el director si o si, solo toma de usuario si no hay director. ES GENIAL y sin bw.
	[] (empty (LinkDirector)) && (not empty (LinkUser)) -> receive linkUser(Doc);
	
	fi 
	send LinkImpresora[idImp);
	}


}


}
process Impresora[id:0..2]{

text Doc;
while(true){
	send hayDocs(id);
	
	receive linkImpresoras[id](Doc);
	
	if(Doc != 'VACIO'){
		Imprimir(Doc);
	}
}
}
