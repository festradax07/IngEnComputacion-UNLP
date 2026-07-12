Program ej2;
uses crt;
const VALORALTO=9999;
Type
	str50=string[50];
	producto=record
	cod:integer;
	nombre:str50;
	descripcion:str50;
	precio:real;
	stock:integer;
	end;
	{me piden la baja logica de todos productos con stock =0}
	archivop=file of producto;
	{se indica la baja debe indicarse marcando el reg con un caracter en algun campo str @}
	
procedure leer(var arch:archivop;dato:producto);
begin
	if (not eof(arch)) then
		read(arch,dato);
	else
		dato.cod:=VALORALTO;
end;

procedure  bajalogica(var arch:archivop);
var act:producto;
begin
	reset(arch);
	leer(arch,act);
	while(act.cod <> VALORALTO) do begin
		if(act.stock = 0) and (act.nombre[1] <> '@')then begin
			writeln ('se borra el elemento ', act.nombre);
			act.nombre:= '@' + act.nombre;
			seek(arch, FilePos(arch)-1);
			write(arch,act);
		end;
		leer(arch,act);
	end;
	close(arch);
end;

var arch:archivop;
begin
	assign(arch, '/tmp/ej2_archprod');
	bajalogica(arch);
end.
	
