Procedure EMPRESA IS 

task type SEDE;
TASK SISTEMA IS
    ENTRY PedirModelo(modelo: out text);
    ENTRY darStock(cant);
End SISTEMA;

TASK BODY SEDE IS
    modelo: text ;
    cant: integer;
BEGIN
    LOOP
        Sistema.PedirModelo(MODELO);
        devolverStock(modelo,cant);
        Sistema.darStock(cant);
    END LOOP;
END SEDE;
arSede: array(1..S) of SEDE;

TASK SISTEMA IS 
    modelo:text; total; cant: integer;
BEGIN
    LOOP
        total:=0;
        darmodelo(modelo);
        for i in 1..S*2 LOOP
            SELECT
                ACCEPT PedirModelo(model: out text) DO
                    model:=modelo;
                END PedirModelo;
            OR 
                WHEN (PedirModelo' count = 0) =>
                    ACCEPT DarStock(cant: in integer);
                    total:= total +cant;
            END SELECT;
        END LOOP;
        guardartotal(total) // persiste en bd o algo asi 
    END LOOP;
end sistema;

begin
    NULL
end;
