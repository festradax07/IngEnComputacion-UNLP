Procedure parcial is
	task type cliente;
	task type servidor is
		entry Resolver(sec:IN text;res:OUT integer);
	end servidor;
	task reloj is
		entry iniciar;
	end reloj;
	task empresa is 
		entry Pedido(S:IN text; R:OUT integer);
		entry FinTiempo;
	end empresa;
	arrClientes: array (0..N-1) of cliente;
	arrServidores: array (0..3)of servidor;
	TASK BODY cliente is
		resultado:integer;
		Secuencia:text;
	begin
		loop
			secuencia:=GenerarSecuencia();
			Empresa.Pedido(Secuencia, Resultado);
		end loop;
	end cliente;
	TASK BODY empresa is
		numS: integer:=0;
	begin
		Reloj.Iniciar;
		loop
			select
				when (Fintiempo' count=0) => accept Pedido(S:IN text;R:OUT integer) do
					arrServidores[numS].Resolver(S,R);
				end Pedido;
			or
				accept FinTIempo do 
					numeS:= numS mod 4;
				end FinTiempo;

			end select;
		end loop;
	end empresa;
	TASK BODY reloj is 
	begin
		accept Iniciar;
		loop
			delay(6hrs)
			Empresa.FinTiempo;
		end loop;
	end reloj;
	TASK BODY servidor is
	begin
		loop
			accept Resolver(sec:IN text; res:OUT integer) do
				res:=Resolver(sec);
			edn Resolver;
		end loop;
	end servidor;
begin 
	null;
End parcial;
