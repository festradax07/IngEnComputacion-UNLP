chan pedidos(idC,texto);
chan pedidosVendedores[V](idC,texto);
chan haypedido(idV);
chan pedidosCocineros(idC,texto);
chan comidas[C](comida);


process Cliente [id:0..C-1]{
text combo= elegirCombo();
Comida c
send pedidos(id,combo);
receive comidas[id](c);

}

process CoordinadorV{
	text texto, int idp,idv;
	while (true){
		receive hayPedido(idv);
		if (empty(pedidos)) {texto='vacio'; idc=-1}
		else receive pedidos(idc,texto);
		send pedidosVendedores[idv](idc,texto);
	}
}

process Vendedores[id:0..2]{
	text pedido; int idp;

	while(true){
		send hayPedido(id);
		receive pedidosVendedores[id](idc,pedido);
		if (pedido <> 'vacio') send pedidosCocineros(idc,pedido);
		else delay(random(1,3));
	}
}
process Cocinero[id:0..1]{

int idc; text pedido;
while (true){
	receive pedidosCocineros(idc, pedido);
	comida c =cocinar(pedido);
	send comidas[idc](c);
}
}
