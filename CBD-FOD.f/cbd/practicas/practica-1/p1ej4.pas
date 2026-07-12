program ej4;
type
	archivo=file of integer;
procedure archToText(var arch: archivo);
var archivo_texto:Text; cantidad:integer;
begin
	assign(archivo_texto,'votantes.txt');
	rewrite(archivo_texto);
	while ( not eof(arch)) do begin
		read(arch, cantidad);
		writeln(archivo_texto, cantidad);
	end;
	close(archivo_texto);
end;

var nom_archivo:string [20];archivo_votantes: archivo;
begin
	read(nom_archivo);
	assign(archivo_votantes,nom_archivo);
	reset(archivo_votantes);
	archToText(archivo_votantes);
	close(archivo_votantes);
end.
