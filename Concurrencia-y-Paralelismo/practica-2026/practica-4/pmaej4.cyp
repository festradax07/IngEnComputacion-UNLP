 10 cabinas
 1 empleado
 n clientes  cliente --> empleado | prioridad a los que terminaron de usar cabina. se le entrega factura a los clientes

chan pedidos(int, accion text);
chan darCabina[N](int); // idC,idCab
chan factura[N](text);
 
 process Cliente [id: 0.. N-1]{
 text f; int idCab;
 send pedido(id,'pedir');
 receive darCabina[id](idCab);
 usarcabina(idCab);
 send pedido(id,'pagar');
 receive factura[id](f);
 }
 
 process Empleado{

	while (true){
		receive pedido(idC,accion);
		if (accion <> 'pagar') ->
			send darCabina[idC](darcabdisponible());

		else
			cobrar();
			send factura[idC](hacerfactura());
		fi


	}

 }
