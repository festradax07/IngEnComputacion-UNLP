program corteControl;

procedure leer(var arch:Archivo; var dato:Disco); // lectura de elemento en archivo
begin
if( not eof(arch)) then
	read(arch,dato) // si no llego al final del archivo, leo elemento
else
	dato.autor.cod_autor:= VALOR_ALTO; // sino, consigo el valor alto en el campo especifico
end;
procedure informar(var arch:Archivo; var texto:text); // archivo fuente y archivo de texto: reporte
var total_discografica,total_autor,total_genero,cod_autoract:integer;generoact:str15; dato:Disco; // variables auxiliares
// ordenado por codautor -> genero -> nombre del disco 
begin
	writeln('DISCOGRAFICA EL PAPU');
	writeln('--------------------');
	leer(arch,dato);
	total_discografica:=0;
	while(dato.autor.cod_autor<>VALOR_ALTO) do begin  // en base al agrupamiento de elementos, debo utilizarlos.
		cod_autoract:=dato.autor.cod_autor;
		total_autor:=0; // voy imprimiendo y totalizando como si fuera un corte de control de una lista. Pensarlo así.
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
