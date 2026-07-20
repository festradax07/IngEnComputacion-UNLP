PROCEDURE limpieza is
	TASK Empresa IS
		ENTRY Pedido (id: IN integer);
		ENTRY Reclamo(id:OUT integer);
	END EMPRESA;

	TASK TYPE PERSONA IS
		ENTRY Identificador(id: IN integer);
		ENTRY LlegadaCamion;
	END PERSONA;
	arrPersonas: array (1..P) of Persona;
	TASK BODY Persona IS
		seguir: boolean :=true;
		idP: integer;
	BEGIN
		ACCEPT Identificador(id: IN integer) DO
			idP:= id:
		END Identificador;
		WHILE (seguir) LOOP
			Empresa.pedido(id);
			SELECT
				ACCEPT LlegadaCamion do
					seguir:=false;
				END llegadaCamion;
			OR DELAY 900.0
				NULL;
			END SELECT;
		END LOOP;
	END PERSONA;

	TASK TYPE CAMION;
	arrCamion:array(1..3) of CAMION;
	
	TASK BODY CAMION IS
		idP:integer;
	BEGIN
		LOOP
			Empresa.reclamo(idp);
			arrPersonas(idp).llegadaCamion;
		END LOOP;
	END CAMION;
	
	TASK BODY EMPRESA IS
		idP: integer;
		arrContador: array(1..P) of integer;
		max:= integer:=-1;
		cantreclamos:integer :=0;
	BEGIN
		FOR i IN 1..P LOOP
			vecContador(i):=0;
		END LOOP;
		LOOP
			SELECT
				ACCEPT pedido(id:IN integer) DO
					if(arrContador(idp) =0) then
						cantreclamos:= cantreclamos +1;
					END IF;
					arrContador(idP):= arrContador(idP) + 1;
				END pedido;
			OR
				When (cantReclamos >0) =>
					ACCEPT reclamo(max: OUT integer) DO
						max:= darMaximo(arrContado) {da el id del maximo en el vector contador}
						vecContador(max):= -1;
						max:=-1;
					end reclamo;

			END SELECT;
		END LOOP;
	END EMPRESA;
BEGIN
	FOR I IN 1..P LOOP
		arrPersonas(i).identificador(i);
	END LOOP
END LIMPIEZA;
