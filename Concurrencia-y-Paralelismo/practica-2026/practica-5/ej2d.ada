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
		OR DELAY 600;// espero 10 mins
			SELECT 
				Empleado.pedido('datos',res); // vuelvo a intentar otra vez
			ELSE // si no me contestan me voy 
				NULL
			END SELECT;
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
