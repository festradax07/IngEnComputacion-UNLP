Procedure bases is

Task Type Lector;
TASK TYPE Escritor;

TASK ADMINBD is
    ENTRY EntradaLector();
    ENTRY EntradaEscritor();
    ENTRY SalidaLector();
    ENTRY SalidaEscritor();
END ADMINBD;

arrLectores:array (1..L) of Lector;
arrEscritores: array(1..E) of Escritor;

Task body Lector is
BEGIN
    LOOP
        SELECT
            ADMINBD.EntradaLector()
            --leer
            ADMINBD.SalidaLector()
        OR DELAY 120
            DELAY(300);
        END SELECT;
    END LOOP;
END Lector;

TASK BODY Escritor is
BEGIN  
    LOOP
        SELECT
            ADMINBD.EntradaEscritor();
            --escribir
            ADMINBD.SalidaEscritor();
        else
            DELAY(60);
        END SELECT;
    END LOOP
END Escritor;

TASK BODY ADMINBD is
    lectores: int :=0;
BEGIN
    LOOP
        SELECT
            WHEN (lectores=0) =>
                accept EntradaEscritor();
                -- espero a que termine
                accept salidaEscritor();
        OR
            WHEN (EntradaEscritor' count =0) =>
                accept EntradaLector;
                lectores++;
        OR 
            accept SalidaLector();
            lectores--;
        END SELECT;
    END LOOP
END ADMINBD;