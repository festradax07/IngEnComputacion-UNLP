program p2ej2; // corte de control - very funny
const VALOR_ALTO=9999; 
type
	str15=string[30];
	Autor= record
		cod_autor:integer;
		nom_autor:str15;
	end;
	Disco=record
		autor:Autor;
		nom_disco:str15;
		genero:str15;
		cant_ventas:integer;
	end;
	Archivo=file of Disco;
procedure leer(var arch:Archivo; var dato:Disco);
begin
if( not eof(arch)) then
	read(arch,dato)
else
	dato.autor.cod_autor:= VALOR_ALTO;
end;
procedure informar(var arch:Archivo; var texto:text);
var total_discografica,total_autor,total_genero,cod_autoract:integer;generoact:str15; dato:Disco;
// ordenado por codautor -> genero -> nombre del disco 
begin
	writeln('DISCOGRAFICA EL PAPU');
	writeln('--------------------');
	leer(arch,dato);
	total_discografica:=0;
	while(dato.autor.cod_autor<>VALOR_ALTO) do begin
		cod_autoract:=dato.autor.cod_autor;
		total_autor:=0;
		writeln('AUTOR: ', dato.autor.nom_autor);
		while(dato.autor.cod_autor <> VALOR_ALTO) and (dato.autor.cod_autor = cod_autoract) do begin
			generoact:=dato.genero;
			total_genero:=0;
			writeln('GENERO:  ', dato.genero);
			while(dato.autor.cod_autor <>VALOR_ALTO) and (dato.autor.cod_autor= cod_autoract) and (dato.genero = generoact) do begin
				total_genero:= total_genero + dato.cant_ventas;
				writeln('DISCO:  ',dato.nom_disco , '  cantidad vendida:  ', dato.cant_ventas); 
				writeln(texto,dato.nom_disco, '  ', dato.autor.nom_autor, '  ', dato.cant_ventas);
				leer(arch,dato);
			end;
			writeln('TOTAL GENERO:  ', total_genero);
			total_autor:= total_autor + total_genero;
		end;
		writeln('TOTAL AUTOR:  ', total_autor);
		total_discografica:= total_discografica + total_autor;
	end;
writeln('TOTAL DISCOGRAFICA:  ', total_discografica);
end;
var
arch:Archivo; texto:text;
begin
	Assign(arch, 'discografica.dat');
	Assign(texto,'reporte_cds.txt');
	reset(arch);
	rewrite(texto);
	informar(arch,texto);
	close(arch);
	close(texto);
end.


