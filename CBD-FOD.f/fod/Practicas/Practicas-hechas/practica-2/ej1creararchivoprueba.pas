program CrearArchivoPersonalizado;
uses crt;

type
    str50 = string[50];
    Empleado = record
        cod: integer;
        nombre: str50;
        montoc: real;
    end;
    archivoE = file of Empleado;

var
    arch: archivoE;
    e: Empleado;
    nombreArchivo: str50;

procedure Agregar(c: integer; n: str50; m: real);
begin
    e.cod := c;
    e.nombre := n;
    e.montoc := m;
    write(arch, e);
end;

begin
    clrscr;
    writeln('=== CREADOR DE ARCHIVO DE PRUEBA ===');
    write('Ingresa el nombre que quieras para el archivo (ej: comisiones.dat): ');
    readln(nombreArchivo);
    
    assign(arch, nombreArchivo);
    rewrite(arch);

    { --- DATOS DE PRUEBA ORDENADOS POR CODIGO --- }
    
    { Empleado 1: Aparece 3 veces }
    Agregar(1, 'Juan Perez', 1500.0);
    Agregar(1, 'Juan Perez', 2500.0);
    Agregar(1, 'Juan Perez', 1000.0); { Total esperado: 5000 }

    { Empleado 2: Aparece 1 sola vez }
    Agregar(2, 'Ana Gomez', 3200.0);  { Total esperado: 3200 }

    { Empleado 3: Aparece 2 veces }
    Agregar(3, 'Luis Lopez', 4000.0);
    Agregar(3, 'Luis Lopez', 1200.5); { Total esperado: 5200.5 }

    { Empleado 4: Aparece 2 veces }
    Agregar(4, 'Maria Rodriguez', 800.0);
    Agregar(4, 'Maria Rodriguez', 200.0); { Total esperado: 1000 }

    close(arch);
    
    writeln;
    writeln('¡Listo! Archivo "', nombreArchivo, '" creado con exito.');
    writeln('Ahora podes ejecutar TU programa e ingresarle ese mismo nombre.');
    readkey;
end.
