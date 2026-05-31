Program ej1;
uses crt;
const VALORALTO=9999;
Type
	str50=string[50];
	Empleado=record
	cod:integer;
	nombre:str50;
	montoc:real;
	end;
	archivoE=file of Empleado;
	
procedure leer(var arch:archivoE;var dato:Empleado);
begin
	if not eof(arch) then
		read(arch,dato)
	else
		dato.cod:=VALORALTO;
end;
procedure verificarSalida(var archRes: archivoE);
var
    e: Empleado;
begin
    reset(archRes); { Volvemos a abrir el archivo desde el principio }
    
    writeln;
    writeln('--- CONTENIDO DEL ARCHIVO TOTALIZADO (VERIFICACION) ---');
    writeln('COD   NOMBRE                    TOTAL ACUMULADO');
    writeln('-----------------------------------------------------');
    
    leer(archRes, e);
    while (e.cod <> VALORALTO) do begin
        writeln(e.cod:3, '   ', e.nombre:25, ' $', e.montoc:0:2);
        leer(archRes, e);
    end;
    
    close(archRes); { Lo cerramos al terminar de listar }
    writeln('-----------------------------------------------------');
end;

var arch,archn:archivoE;
	e,eact:Empleado; nombrefile:str50;
begin
	readln(nombrefile);
	assign(arch,nombrefile);
	assign(archn,'ej1_empleados_totalizado.dat');
	reset(arch); {abro archivo}
	rewrite(archn); {creo archivo}
	leer(arch,e);
	while (e.cod <> VALORALTO) do begin
		eact:= e;
		leer(arch,e);
		while (eact.cod = e.cod) do begin {cada empleado puede aparecer mas de una vez}
			eact.montoc:= eact.montoc + e.montoc;
			leer(arch,e);
		end;
		write(archn,eact);
	end;
	close(archn);
	close(arch);
	writeln ('creado el archivo totalizado');
	verificarSalida(archn);
	readkey;
end.
