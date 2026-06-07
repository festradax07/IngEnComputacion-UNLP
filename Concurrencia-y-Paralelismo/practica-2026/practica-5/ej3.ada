Procedure sistema is 
	Task Central is
		Entry SignalP1(signal: IN texto);
		Entry SignalP2(signal:IN texto);
		Entry timeout;
	END Central;

	Task timer is 
		Entry timeinit;
	End timer;

	Task Body timer is
	Begin
		LOOP
			Accept timeinit;
			DELAY(180);
			Central.timeout; {le aviso que su tiempo termino y debe cambiar}
		END LOOP;
	END;

	Task P1;
	
	Task Body P1 is
		signal:texto;
	BEGIN
		LOOP
			signal:= medirSignal();
			SELECT
				Central.SignalP1(signal);
			OR DELAY 120
				NULL;
			END SELECT;
		END LOOP;
	END P1;
	
	TASK P2;
	TASK BODY P2 IS 
		signal:texto;
	BEGIN
		LOOP 
			SELECT
				signal:=medirSignal();
				Central.SignalP2(signal);
			ELSE
				DELAY 60;
				Central.SignalP2(signal);
			END SELECT;
		END LOOP;
	END;

	TASK BODY CENTRAL IS
		corte:boolean;
	BEGIN
		ACCEPT SignalP1(signal:IN texto);
		LOOP
			SELECT
				ACCEPT SignalP1(signal:IN texto);
			OR
				ACCEPT SignalP2(signal:IN texto) DO
					timer.timerinit;
					corte:=false;
					while (not corte) loop
						SELECT	
							Accept signalP2(signal);
						OR
							ACCEPT timerout DO;
								corte:=true
							END timerout;
						END SELECT;
					END LOOP;
				END SIGNALP2;
			END SELECT;
		END LOOP;
	END CENTRAL;
	
BEGIN
	NULL;
END Sitema;
