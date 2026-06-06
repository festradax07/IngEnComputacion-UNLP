Program ej3;
uses crt;
const VALORALTO=9999;
Type
	str50=string[50];
	libro=record
	cod:integer;
	nombre:str50;
	autor:str50;
	genero:str50;
	precio:real;
	paginas:integer;
	end;
	{me piden uso de lista invertida para reutilizacion de espacio}
	archivol=file of libro;
procedure leer(var a:archivol,dato:libro);
begin
	if (not eof(a)) then
		read(a,dato);
	else
		dato.cod:= VALORALTO;
end;
procedure leerl(var l:libro);
begin
	readln(a.cod);
	readln(a.nombre);
	readln(a.autor);
	readln(a.genero);
	readln(a.precio);
	readln(a.paginas);
end;

procedure crearArchivo(var a:archivol);
var l:libro; nombrearchivo);
begin
	read(nombrearchivo);
	assign(a,nombrearchivo);
	rewrite(a);
	{cargo cabecera}
	l.cod=0;
	write(a,l);
	leerl(l);
	while( l.cod <>0) do begin
		write(a,l) {asumo que los suben ordenados por cod}
		leerl(l);
	end;
	close(a);
end;

procedure altalibro(var arch:archivol);
var pos:integer; head,l:libro;
begin
	reset(arch);
	leerl(l)
	read(arch,head) {leo el contenido del head}
	if( head.cod =0) then begin{significa que no tengo espacios disponibles, voy directo al eof}
		seek(arch,fileSize(arch));
		write(arch,l);
	end
	else begin
		pos:= head.cod * -1; {la distnacia respecto del siguiente bloque libre}
		seek(arch, pos);
		read(arch,head); {ya que era un espacio disponible debe tener la direccion del siguiente bloque libre respecto del head o 0}
		seek(arch,filepos(arch)-1);
		write(arch,l); {uso el espacio para el nuevo reg}
		seek(arch,0);
		write(arch,head); {actualizo cabecera con el proximo espacio disponible}
	end;
	close(arch);
end;

procedure bajalibro(var arch:archivol);
var pos,codborrar: integer; l,head:libro;
begin
	writeln('escribir cod a borrar');
	readln(codborrar);
	reset(arch);
	read(arch,head);
	leer(arch,l);
	while ((l.cod<> VALORALTO) and (codborrar <> l.cod))do begin
		leer(arch,l):
	end;
	if( l.cod =codborrar) then begin
		pos:= filepos(arch) -1 {distancia respecto del head}
		seek(arch,pos);
		write(arch,head); {coloco la cabecera}
		l.cod:= pos *-1:
		seek(arch,0);
		write(arch,l);
		writeln('libro eliminado');
	end
	else writeln( 'el codigo elegido no existe en el archivo');
	close(arch);
end;
		
		
