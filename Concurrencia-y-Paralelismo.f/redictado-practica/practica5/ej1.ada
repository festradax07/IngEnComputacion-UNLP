Se quiere modelar la cola de un banco que atiende un solo empleado, los clientes llegan y si esperan mas de 10 minutos se retiran.

procedure banco is 

TASK Empleado is
	Entry Pedido(Doc: in texto; Res:out texto);
end Empleado;
TASK TYPE cliente;

VecClientes:Array(1..N) of cliente;

TASK BODY cliente is
	Result:texto;
begin
	select
		Empleado.Pedido("Datos",result);
	or delay 600
		null;
	end select;
end cliente;

TASK BODY Empleado is
begin
	loop
		accept Pedido(D:in texto; R:out texto) do
			R:=resolverPedido(D);
		end pedido;
	end loop;
end Empleado;

begin
  null;
end banco;
