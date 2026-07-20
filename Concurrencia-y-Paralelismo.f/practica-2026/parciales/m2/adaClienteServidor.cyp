Procedure empresa IS
task type SUCURSAL;
task BODY sucursal IS
    codigo,valor: integer;
begin
    loop
        Herramienta.PedirArticulo(codigo);
        valor:=ObtenerVentas(codigo);
        Herramienta.darResultado(valor);
        Herramienta.SiguienteBusqueda;
    end loop
END SUCURSAL;

arrsucursales: array (1..100) of SUCURSAL;

TASK Herramienta IS
    ENTRY PedirArticulo(codigo);
    ENTRY DarResultado(codigo);
    ENTRY SiguienteBusqueda();
END Herramienta;

TASK BODY Herramienta IS
    cod,valor,total: integer;
begin
    loop  
            cod= GenerarArticulo();
            total:=0;
            for i in 1..200 loop
                SELECT
                    ACCEPT PedirArticulo(id: out integer) do
                        id:= cod;
                    END PedirArticulo;
                OR
                    WHEN (PedirArticulo'count=0) =>
                        ACCEPT DarResultado(valor: in integer);
                        total:= total + valor;
                END SELECT;
            END loop
            -- ya tengo todos
            FOR i in 1..100 loop
                accept SiguienteBusqueda;
            end loop

    END LOOP;
END Herramienta;
