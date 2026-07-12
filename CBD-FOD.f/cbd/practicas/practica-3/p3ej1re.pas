program p3ej1re;
const VALOR_ALTO=9999; CORTE=1000;MARCA=-1;
type
	Especie=record
		cod_esp:integer;
		nom_vulgar:str20;
		nom_cientifico:str20;
		altura:real;
		promedio:real;
		descripcion:string;
		zona_geo:str20;
	end;
	ArchivoPlantas:file of Especie;
	// sumemosle colocar los archivos borrados en un archivo de texto
procedure bajaFisica2(var a:ArchivoPlantas; cod:integer);
var posborrar:integer;rplanta,aux:Especie;
begin
	reset(a) // voy al inicio del archivo
	readln(cod);//leo o deberia venir 
	read(a,rplanta)
	while(not eof(a)) and (rplanta.cod_esp <> cod) do begin
		read(a,rplanta);
	end;
	if(rplanta.cod_esp=cod) then begin
		posborrar:= filepos(a)-1;
		seek(a,filesize(a)-1); // final del archivo
		read(a,aux);
		seek(a,posborrar);
		write(a,aux);
		seek(a,filesize(a)-1);
		truncate(a);
	end;
end
procedure bajaFisica1(var a:ArchivoPlantas; cod:integer;var a2:ArchivoPlanta);
var rplanta:Especie;
begin
	read(a,rplanta);
	while( not eof(a)) and (rplanta.cod_esp<>cod) do begin
		read(a,rplanta);
	end;
	if(rplanta.cod_esp =cod) then begin
		rplanta.cod_esp:=MARCA;
		seek(a,filepos(a)-1);
		write(a,rplanta);
	end;
	reset(a); // vuelvo al inicio del archivo para la siguiente eliminacion/ marca
end;
procedure EliminacionFisica1 (var a:ArchivoPlantas; var a2:ArhcivoPlantas);
var rplanta:Especie;
begin
	read(a,rplanta);
	while(not eof(a)) do begin
		if(rplanta.cod_esp<>MARCA) then
			write(a2,rplanta);
		read(a,rplanta);
	end;

end;

