En una playa hay 5 equipos de 4 personas cada uno (en total son 20 personas donde cada
una conoce previamente a que equipo pertenece). Cuando las personas van llegando
esperan con los de su equipo hasta que el mismo esté completo (hayan llegado los 4
integrantes), a partir de ese momento el equipo comienza a jugar. El juego consiste en que
cada integrante del grupo junta 15 monedas de a una en una playa (las monedas pueden ser
de 1, 2 o 5 pesos) y se suman los montos de las 60 monedas conseguidas en el grupo. Al
finalizar cada persona debe conocer grupo que más dinero junto. Nota: maximizar la
concurrencia. Suponga que para simular la búsqueda de una moneda por parte de una
persona existe una función Moneda() que retorna el valor de la moneda encontrada.


procedure ej6 is
	TASK TYPE PERSONA is;
		ENTRY eqGanador(res:in integer);
	TASK TYPE EQUIPO is;
		ENTRY LLEGAR();
	TASK COORDINADOR is;
		ENTRY 
	end COORDINADOR;
	ArrEquipo: array (1..5) of Equipo;
	ArrPersonas: array (1..20) of Persona;
	TASK BODY Persona is
		id_Equipo: ObtenerEquipo();
		monedas:integer:=0;
		res: integer:=-1;
	begin
		ArrEquipo(id_equipo).llegar; -- se deberia dejar la comunicacion cuando los reporto a los 4.
		ACCEPT iniciar;
		FOR I in 1..15 loop
			monedas:= monedas + obtenerValorMoneda();
		end Loop;
		ArrEquipo(id_equipo).Totalmonedas(monedas);
		Accept EqGanador(res);
	end Persona;
	TASK BODY COORDINADOR IS;
		totales: array (1..5) of integer;
		cant, id,idRes:integer;
	begin
		for i=1..5 loop
			ACCEPT resultado(cant,id: in integer);
			totales(id):= cant;
		end loop;
		CalcularMaximo(totales,idRes);
		for i=1..5 loop;
			ArrEquipo(i).darGanador(idRes);

	end COORDINADOR;
	TASK BODY Equipo is;
		idE:integer;
		parcial,total,cant_int: integer;
		PersonasId: array(1..4) of integer;
	begin
	      LOOP
		Select
			ACCEPT Llegar(id: IN integer) do
				cant_int:= cant_int + 1;	
				PersonasId[cant_int]:=id;
			end Llegar;

			WHEN cant_int = 4 => 
				for I in 1..4 LOOP
					ArrPersonas(PersonasId(i)).Iniciar;
				end LOOP;
		 END SELECT;
	    END LOOP;
	    For i = 1..4 loop;
		    Accept TotalMoneda(parcial:IN integer); do
			  total:= total + parcial;
		    end TotalMoneda;
	   end loop;
		Coordinador.resultado(total,idE);
		Accept resultado(idR);
		for i= 1..4 loop;
			ArrPersonas(PersonasId[cant_int]).eqGanador(idR);
		end loop;
	end Equipo;


