En una oficina hay un empleado y P personas
que van para ser atendidas para realizar un trámite. Cuando una persona llega espera a lo
sumo 20 minutos a que comience a atenderla el empleado para resolver el trámite que va
a hacer, y luego se va; si pasó el tiempo se retira sin realizar el trámite. El empleado
atienden las solicitudes en orden de llegada. Cuando las P personas se han retirado el
empelado también se retira. Nota: cada persona hace sólo un pedido y termina; suponga
que existe una función Atender() llamada por el empleado que simula que el empleado
está resolviendo el trámite del cliente; todas las tareas deben terminar.



procedure parcial is

	TASK Type Persona;
	TASK Empleado is
		entry Resolver(t:IN text; res: OUT text);
		entry terminar;
	end Empleado;
	TASK Admin is
		entry mevoy;
	end Admin;

	arrPersonas: array(0..P-1) of Persona;

	TASK BODY PERSONA IS
		Resultado:text;
		Tramite:text:=...;
	begin
		Select
			Empleado.Resolver(Tramite,Resultado);
		or delay 1200.0
			null;
		end loop;
		Admin.mevoy;
	end Persona;
	TASK BODY ADMIN IS
	begin
		for i in 1..p loop
			accept mevoy;
		end loop;
		Empleado.Terminar;
	end Admin;
	TASK BODY Empleado is
		fin:boolean:=false;
	begin
		while(not fin) loop
			select
				accept Resolver(t:IN text; res:OUT text) do
					res:= Atender(t);
				end resolver;
			or
				accept Terminar;
				fin:= true;
			end select;
		end loop;
	end Empleado;

begin
	null
end parcial;
