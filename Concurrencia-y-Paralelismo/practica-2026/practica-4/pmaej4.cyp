 10 cabinas
 1 empleado
 n clientes  cliente --> empleado | prioridad a los que terminaron de usar cabina. se le entrega factura a los clientes

chan pedidos(int, accion text);
chan darCabina[N](int); // idC,idCab
chan liberarCabina(int,int);
chan atender(int);
chan factura[N](int);

process Cliente[id:0..N-1]{
	send pedido(id);
	send atender(1);
	receive darCabina[id](idCab);
	-- usar cabina
	send liberarCabina(idCab,idCliente);
	send atender(0);
	receive factura[id](fact);
}

process Empleado{
	cola cabina; // 10 recursos
	int valor;
	while(true){
		receive atender(valor);
		if(!empty(pedido)) and (empty(liberarCabina)){
			receive pedido(idC);
			idCab= pop(cabina);
			send darCabina[idC](idCab);
		}else if(!empty(liberarCabina)){
			receive liberarCabina(idCab,idC);
			push (cabina,idCab);
			comprobante= cobrar();
			send factura[idC](comprobante);
		}
	}
}
