chan Pedidos(texto,int);
chan hayPedido(int);
chan pedidoVendedor[3](texto,int);
chan Cocinar(texto,int)
chan comida[n]
proceso coordinador{
	int idVendedor, idC; text pedido;
	while (true){
		receive hayPedido(idVendedor); 
		if(empty(Pedidos)) idC=-1;
		else receive Pedidos(pedido,idC);
		send pedidoVendedor[idVendedor](pedido,idC);
	}


}
proceso Vendedor [id:0..2]{
	int idC, idCo;
	while (true){
		send hayPedido(id);
		receive pedidoVendedor[id](pedido,idC);
		if(idc <> -1) send cocina(pedido,idC);
		else delay(Random(121)+60); // entre 1 y 3 minutos inactivo

	}

}
proceso cocinero[id:0..1]{
	Comida plato;
	while(true){
		receive(pedido,idC);
		plato=Cocinar();
		send comida[idC](plato);
	}
}
proceso Cliente[id:0..n-1]{
	Comida plato;
	texto pedido=LeerMenu();
	send Pedidos(pedido,id);
	receive Comida[id](plato);
}
