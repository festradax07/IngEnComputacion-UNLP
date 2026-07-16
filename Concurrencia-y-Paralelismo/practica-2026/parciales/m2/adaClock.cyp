Procedure Ada is
    
    TASK TYPE cliente;
   
    TASK BODY CLIENTE is
        res: integer;
        secuencia:text;
    BEGIN
        LOOP
            secuencia:= GenerarSecuencia();
            Empresa.Pedido(secuencia,res);
        END LOOP;
    ENF CLIENTE;

    TASK RELOJ is
        ENTRY INICIAR();
    END RELOJ;

    TASK BODY RELOJ is
    BEGIN   
        Accept iniciar;
        LOOP
            delay(6hrs)
            Empresa.Fintiempo;
        end LOOP
    END RELOJ;
    
    arrClientes: array(1..N) of cliente;
    arrServidores: array (0..3) of servidor;
    
    TASK EMPRESA is
        ENTRY  PEDIDO(S:IN TEXT; R:OUT integer);
        ENTRY  Fintiempo;
    END EMPRESA
    TASK BODY EMPRESA is
        numS: integer :=0;
    BEGIN
        reloj.Iniciar;
        LOOP
            SELECT
                when(Fintiempo'count=0) =>
                    accept Pedido(S:IN text; R:OUT integer) DO
                        arrServidores[numS].resolver(S,R);
                    end Pedido;
                OR
                    accept FinTiempo;
                    nums:= nums mod 4;
            END SELECT;
        END LOOP;
    END EMPRESA;

    TASK SERVIDOR is
        ENTRY RESOLVER(SEC:IN TEXT; RES:OUT INTEGER);
    END SERVIDOR;

    TASK BODY SERVIDOR is
    BEGIN
        LOOP
            ACCEPT RESOLVER(SEC:IN TEXT, RES:OUT INTEGER) DO
                RES:=RESOLVER(SEC);
            END RESOLVER;
        END LOOP;
    END SERVIDOR;

BEGIN
    NULL
END ADA;