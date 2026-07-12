program parcialcbd2023;
const VALOR_ALTO=9999;
Type
	profesional=record
		dni:integer;
		nombre:string;
		apellido:string;
	end;
	tArchivo:File of profesional;
// asumimos que la info la conseguimos de un archivo de texto
procedure crear(var arch:tArchivo, var info:text);
var p:profesional;
begin
	//suponemos al archivo con info
	
	reset(info);
	rewrite(arch);
	p.dni := 0; // indica pila vacía
	p.nombre := '';
	p.apellido := '';
	write(arch, p);
	readln(info,p.dni,p.nombre,p.apellido);
	while(not eof(info)) do begin
		write(arch,p);
		readln(info,p.dni,p.nombre,p.apellido);
	end;
	close(info);
	close(arch);
end;
procedure agregar(var arch: tArchivo; p:profesional);
var aux:profesional; posicion:integer;
begin
reset(arch);
read(arch,aux);
if(aux.dni <>0) then begin
	seek(arch, filesize(arch)); // voy al final
	write(arch,aux);
end
else begin
		posición:= aux.dni *-1;
		seek(arch,posicion);
		read(arch,aux);
		seek(arch,filepos(arch)-1);
		write(arch, p);
		seek(arch,0)
		write(arch,aux);
end;
close(arch);
end;
procedure baja(var arch:tArchivo;dnibaja:integer;var bajas: TEXT);
var posborrar:integer;head,elem:profesional;
begin
reset(arch);
append(bajas);
read(arch,elem);
head:=elem;
while(not eof(arch)) and (elem.dni <> dnibaja) do 
	read(arch,elem);
if(elem.dni = dnibaja) then begin
	posborrar:= filepos(a)-1;
	seek(arch, posborrar);
	writeln(bajas,elem.dni,elem.nombre,elem.apellido);
	write(arch,head);
	head.dni:= posborrar*-1;
	seek(arch,0);
	write(arch,head);
end
else
	writeln("dni no encontrado!");
close(bajas);
close(arch);
end;
