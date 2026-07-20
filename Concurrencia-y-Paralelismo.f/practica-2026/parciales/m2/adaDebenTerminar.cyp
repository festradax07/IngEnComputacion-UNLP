Procedure ParcialAda irse
    TASK TYPE Persona;
    TASK Empleado is 
        ENTRY RESOLVER(T: IN TEXT; RES: OUT TEXT);
        ENTRY TERMINAR;
    END EMPLEADO;

    TASK ADMIN IS 
        ENTRY ME VOY;
    END ADMIN;

    TASK BODY EMPLEADO IS
        FIN: BOOLEAN:= FALSE;

    BEGIN
        WHILE (NOT FIN) LOOP
            SELECT
                ACCEPT RESOLVER(T: IN TEXT; RES:OUT TEXT)DO
                    RES:= ATENDER(T);
                END RESOLVER;
            OR 
                ACCEPT TERMINAR;
                FIN:= TRUE;
            END SELECT;
        END LOOP;
    END EMPLEADO;

    ARRPERSONAS:ARRAY(1..P) OF PERSONA;

    TASK BODY PERSONA IS
        RESULTADO:TEXT;
        TRAMITE: TEXT := DARVALOR();
    BEGIN
        SELECT
            EMPLEADO.RESOLVER(TRAMITE,RESULTADO);
        OR DELAY 1200
            NULL;
        END LOOP;
        ADMIN.MEVOY;
    END PERSONA;

    TASK BODY ADMIN IS
    BEGIN
        FOR I IN 1..P LOOP
            ACCEPT MEVOY;
        END LOOP;
        EMPLEADO.TERMINAR;
    END ADMIN;

    BEGIN
        NULL
    END ParcialAda
    
