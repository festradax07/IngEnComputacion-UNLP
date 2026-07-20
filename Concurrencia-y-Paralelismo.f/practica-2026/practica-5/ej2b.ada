procedure BANCO is

	Task Type Cliente;
	Task Empleado is;
		Entry pedido (D:IN texto: Res:OUT texto);
	End Empleado;
	
	arrClientes:array(1..N) of Cliente;

	Task Body Cliente is 
		res:texto;
	Begin
		SELECT
			Empleado.pedido('datos',res);
		OR DELAY 600; // espero 10 mins a hacer la request y si no se hace no hago nada NULL
			NULL
		END SELECT;
	End Cliente;

	Task Body Empleado IS
	
	BEGIN
		LOOP
			ACCEPT Pedido(D:IN texto; R: OUT texto) do
				R:= RealizarPedido(D);
			END Pedido;
		END Loop;
	END Empleado;

Begin
	NULL;
END BANCO;
