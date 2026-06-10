procedure workers is 
	Task type Worker;
	arrWorkers:array (1..10) of Worker;
	TASK BODY Worker IS
		arrDis:array(1..100000) of integer := InicializarVector;
		suma: integer :=0;
	BEGIN
		Coordinador.Init;
		For i in 1..100000 LOOP
			suma:=suma + arrDis(i);
		END LOOP;
		Coordinador.Resultado(suma);
	END Worker;

	Task Coordinador is
		ENTRY Init;
		ENTRY Resultado (res:IN integer);
	END Coordinador;
	TASK BODY Coordinador is 
		total: integer :=0;
		prom: float;
	BEGIN
		FOR i IN 1..20 LOOP
			SELECT
				ACCEPT init;
			OR
				WHEN (init'count =0) =>
					ACCEPT Resultado (suma: IN integer) DO
						total:= total + suma;
					END Resultado;
			END SELECT
		END LOOP;
		prom:=(total/100000);
	END Coordinador
end workers;
