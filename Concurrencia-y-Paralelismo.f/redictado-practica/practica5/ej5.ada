En un sistema para acreditar carreras universitarias, hay UN servidor que atiende pedidos de U Usuarios de a uno a la vez y de acuerdo con el orden en que se hace los pedidos. Cada usuario trabaja en el documento a presentar, y luego lo envía el servidor; espera la respuesta del mismo que le indica si esta todo bien o hay algún error. Mientras haya algún error, vuelve a trabajar con el documento y a enviarlo al servidor. Cuando el servidor le responde que está todo bien, el usuario se retira. Cuando un usuario envía un pedido, espera a lo sumo 2 minutos a que sea recibido por el servidor; pasado ese tiempo, espera un minuto y vuelve a intentarlo (usando el mismo documento).

Procedure Simulador is
Task Servidor is
	Entry Pedido(doc:in texto; res:out boolean);
end Servidor;

Task Type Usuario;

arrUsuarios: Array (1..N) of Usuario;

// TASK BODY Servidor is
begin
	loop
		accept Pedido(doc:in texto; res: out boolean) is 
			res:= corregir(doc);
		end pedido; 
	end loop:
end Servidor;

// TASK BODY Usuario is 
	doc:texto;
	listo: boolean := false;
	enviado: boolean:= false;
begin
	while(not listo) loop
		doc:= trabarDoc();
		enviado:=false;
		while(not enviado) loop
		select
			Servidor.Pedido(doc,listo);
			enviado:= true; // se terminó de enviar y sigue la instruccion
		or delay 120.00 
			delay 60.00 (timeout, despues de esto vuelve)
		end select;
		end loop;
	end loop;
end Usuario;
begin
null;
end Simulador;
