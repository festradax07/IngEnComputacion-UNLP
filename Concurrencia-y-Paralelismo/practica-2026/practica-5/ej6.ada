Procedure carreras is

	TASK SERVIDOR IS
		ENTRY EnviarDoc(doc:IN TEXT, res: out boolean);
	END SERVIDOR;

	TASK TYPE USUARIO;
	arrUsuarios:array(1..U) of Usuario;
	TASK BODY Usuario IS
		Doc: text;
		hayError:boolean := true;
	BEGIN
		Doc:= hacerDoc();
		While (hayError) LOOP
			SELECT
				servidor.EnviarDoc(doc,hayError);
				if(hayError) THEN
					doc:=arreglarDoc(doc);
				END if;
			OR DELAY 120.0
				DELAY 60.0;
			END SELECT;
		END LOOP;
	END USUARIO;

	TASK BODY SERVIDOR IS 
	BEGIN
		LOOP
			SELECT
				ACCEPT EnviarDoc(doc:IN text; error: OUT boolean) DO
					error:=analizarDoc(doc);
				END EnviarDoc;
			else
				NULL;
		END LOOP;
	END SERVIDOR;
BEGIN
	NULL;
END CARRERAS;
