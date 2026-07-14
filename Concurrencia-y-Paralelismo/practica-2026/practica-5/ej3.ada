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
			signal:=medirSignal();
			SELECT
				Central.SignalP2(signal);
			ELSE
				DELAY 60;
				Central.SignalP2(signal);
			END SELECT;
		END LOOP;
	END;

	TASK BODY CENTRAL IS
		corte:boolean;
		signal:text;
	BEGIN
		ACCEPT SignalP1(signal:IN texto);
		LOOP
			SELECT
				ACCEPT SignalP1(signal:IN texto);
			OR
				ACCEPT SignalP2(signal:IN texto);
					timer.timerinit;
					corte:=false;
					while (not corte) loop
						SELECT	
							WHEN(timerout' count=0) =>
								Accept signalP2(signal:);
						OR
							ACCEPT timerout;
							corte:=true;
						END SELECT;
					END LOOP;
			END SELECT;
		END LOOP;
	END CENTRAL;
	
BEGIN
	NULL;
END Sitema;
