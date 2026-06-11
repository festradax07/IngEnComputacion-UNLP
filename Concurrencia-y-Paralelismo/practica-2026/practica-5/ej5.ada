Procedure Clinica is 
	TASK MEDICO IS
		ENTRY AtiendeP(pedido: IN texto);
		ENTRY AtiendeE(pedido:IN texto);
	END MEDICO;

	TASK CONSULTORIO IS
		ENTRY DejarNota(nota: IN texto);
		ENTRY RevisarNota(nota: in out text);
	END CONSULTORIO;

	TASK TYPE Persona;
	arrPersonas:array(1..P) of Persona;
	TASK BODY Persona IS
		cantIntentos: integer :=0;
		sigo: boolean := true;
		pedido: text;
	BEGIN
		pedido:= armarPedido();
		While ((cantIntentos <3) and (sigo)) LOOP
			SELECT
				Medico.AtiendeP(pedido);
			OR DELAY 300.0
				cantIntentos:= cantIntentos +1;
				If (cantIntentos <3) THEN
					DELAY 600.0;
				ELSE
					sigo:=false;
				END IF;
			END SELECT;
		END LOOP;
	END PERSONA;
	TASK TYPE enfermera;
	arrEnfermera:array (1..E) of Enfermera;
	TASK BODY Enfermera IS
		pedido:text;
	BEGIN
	   LOOP
		pedido:=armarPedido();
		SELECT
			Medico.atiendeE(pedido);
		Else
			Consultorio.dejarnota(pedido);
		END SELECT;
	   END LOOP;
	END ENFERMERA;

	TASK BODY MEDICO IS
		tarea: text;
	BEGIN
		LOOP
			SELECT
				ACCEPT AtenderP(pedido: IN text) DO
					tarea:= atenderPaciente(pedido);
				END ATENDERP;
			OR
				WHEN (AtenderP'count = 0) =>
					ACCEPT atenderE(pedido: IN text ) do
						tarea:=atenderEnfermera(pedido);
					END atenderE;
			ELSE
				SELECT
					Consultorio.revisarNota(tarea);
					ProcesarNota(tarea);
				ELSE
					NULL;
				END SELECT;
			END SELECT;
		END LOOP;
	END Medico;

	TASK BODY CONSULTORIO IS
		notas:cola;
	BEGIN
		LOOP
			SELECT
				ACCEPT DejarNota(nota: IN text) DO
					push(notas,nota);
				END DejarNota;
			OR
				WHEN (not isEmpty(notas)) =>
					ACCEPT RevisarNotas(nota: IN OUT text)DO
						nota:=pop(notas);
					END RevisarNotas;
			END SELECT
		END LOOP;
	END CONSULTORIO;

BEGIN
	NULL;
END CLINICA;

