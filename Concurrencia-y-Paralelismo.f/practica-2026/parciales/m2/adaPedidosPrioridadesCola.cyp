TASK TYPE regular;
TASK TYPE premium;
TASK Empleado is
    ENTRY atenderRegular(in TEXT, out TEXT);
    ENTRY atenderPremium(in TEXT, out TEXT);
END Empleado

task body regular is
    pago, comprobante: text; // se asume pago cargado;
BEGIN
    SELECT
        Empleado.atenderRegular(pago, comprobante);
    or DELAY (3OMINs)
        NULL
    END SELECT;
END REGULAR;

TASK BODY PREMIUM IS
    pago, comprobante: text;
BEGIN
    Empleado.atenderPremium(pago, comprobante);
END PREMIUM;

TASK BODY EMPLEADO IS
    pago, comprobante: text;
begin
    LOOP
        SELECT
            WHEN (atenderPremium' COUNT=0) => 
                ACCEPT atenderRegular(pago IN TEXT,comprobante OUT TEXT) DO
                    comprobante:=atender(pago);
                END atenderRegular;
        OR
            ACCETO atenderPremium(pago IN TEXT, comprobante OUT text) DO
                comprobante:= atender(pago);
            END atenderPremium;
        END SELECT;
    END LOOP;
END EMPLEADO;