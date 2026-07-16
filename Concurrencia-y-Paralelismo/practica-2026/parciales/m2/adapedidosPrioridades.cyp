2) En un negocio de cobros digitales hay P personas que deben pasar por la única caja de cobros para realizar el pago de
sus boletas. Las personas son atendidas de acuerdo con el orden de llegada, teniendo prioridad aquellos que deben
pagar menos de 5 boletas de los que pagan más. Adicionalmente, las personas embarazadas y los ancianos tienen
prioridad sobre los dos casos anteriores. Las personas entregan sus boletas al cajero y el dinero de pago; el cajero les
devuelve el vuelto y los recibos de pago. Implemente un programa que permita resolver el problema anterior usando
ADA

P personas , 1 caja // atienden por orden de llegada prioridad aquellos con menos de 5 boletas . MAX PRIORIDAD EMBARAZADAS Y ANCIANOS.
PERSONAS ENTREGAN BOLETAS AL CAJERO Y EL DINERO, CAJERO DEVUELVE EL VUELTO Y RECIBOS DE PAGO.

Procedure Negocio is

TASK TYPE Personas;

TASK CAJERO IS
    entry cobrarGeneral(boletas: IN  string, pago: IN float, recibos out string, vuelto out float);
    entry cobrarMenosde5 (boletas: IN  string, pago: IN float, recibos out string, vuelto out float);
    entry cobrarEmbAnc(boletas: IN  string, pago: IN float, recibos out string, vuelto out float);
end CAJERO;

arrPersonas:array(1..P)of Persona;

TASK BODY CAJERO IS
    int c1,c2;
begin
    for i in 1..P LOOP
        SELECT
            when (cobrarEmbAnc' count = 0) and (cobrarMenosde5' count=0) =>
                accept cobrarGeneral(boletas: IN  string, pago: IN float, recibos out string, vuelto out float) DO
                    Cobrar(boletas,pago,recibos,vuelto);
                end cobrarGeneral;
            OR
                when (cobrarEmbAnc' count = 0) =>
                    accept cobrarMenosde5(boletas: IN  string, pago: IN float, recibos out string, vuelto out float) DO
                        Cobrar(boletas,pago,recibos,vuelto);
                    end cobrarMenosde5;
            OR 
                 accept cobrarEmbAnc(boletas: IN  string, pago: IN float, recibos out string, vuelto out float) DO
                        Cobrar(boletas,pago,recibos,vuelto);
                    end cobrarEmbAnc;
        END SELECT
    END LOOP
END CAJERO;

TASK BODY PERSONA IS
    pago,vuelto: float;
    recibo;boletas: string;
BEGIN
    if( soyEmboAnc()) THEN
        cajero.cobrarEmbAnc(boletas,pago,recibos,vuelto);
    else
        if((len(boletas)) < 5 ) then 
            cajero.cobrarMenosde5(boletas,pago,recibos,vuelto);
        else
            cobrarGeneral(boletas,pago,recibos,vuelto);
        end if;
    end if;
end PERSONA;

begin
    NULL
END Negocio;