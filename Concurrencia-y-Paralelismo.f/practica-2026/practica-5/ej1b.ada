**puente 1 sola direccion, 5 un de peso. camionetaa 2 u, camion3 auto1 muchos vehiculos**
necesito, un puente
Procedure Puente is
	TASK Bridge IS
		ENTRY PasaAuto;
		ENTRY PasaCamioneta;
		ENTRY PasaCamion;
		ENTRY Salir (peso: IN integer);
	End Acceso;

	TASK TYPE Auto;
	arrAutos: array (1..A) of Auto;
	TASK BODY Auto IS
	BEGIN
		Bridge.PasaAuto;
		Bridge.Salir(1);
	END Auto;
	
	TASK TYPE Camioneta;
	arrCamionetas: array (1..B) of Camioneta;
	TASK BODY Camioneta IS
	BEGIN
		Bridge.PasaCamioneta;
		Bridge.Salir(2);
	END Camioneta;

	TASK TYPE Camion;
	arrCamiones: array (1..C) of Camion;
	TASK BODY Camion IS
	BEGIN
		Bridge.AccesoCamion;
		Bridge.Salir(3);
	END Camion;

	TASK BODY Bridge IS
		peso: integer := 0;
	BEGIN
		LOOP
			SELECT 
				WHEN (PasaCamion'count=0)and(peso < 5) => 
					ACCEPT PasaAuto;
					peso:= peso + 1;
			OR
				WHEN (PasaCamion'count=0)and (peso < 4) => 
					ACCEPT PasaCamioneta
					peso:= peso + 2;
			OR
				WHEN (peso < 3)  => 
					ACCEPT PasaCamion;
				    peso:= peso + 3;
			OR
                ACCEPT salir (pesoout: IN integer) DO
                    peso:= peso - pesoout;
                END salir;
            END SELECT;	
		END LOOP;
	END Bridge;
Begin
	null;
End Puente;
