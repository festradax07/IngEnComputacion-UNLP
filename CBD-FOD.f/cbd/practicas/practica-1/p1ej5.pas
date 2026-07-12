program ej5;
type
	str20=string[20];
	str10=string[10];
	especie = record
		num: integer;
		max_altura:real;
		nom_cientifico:str20;
		nom_vulgar:str20;
		color:str10;
	end;
	arch_especie:file of especie;
procedure leerEspecie(e: especie);
begin
	with e do begin
		readln(nom_cientifico);
		if(nom_cientifico <> 'zzz') then begin
			readln(num);
			readln(max_altura);
			readln(nom_vulgar);
			readln(color);
		end;
	end;
end;

procedure cargaArchivo(var archivo:arch_especie);
var e: especie;
begin
	leerEspecie(e);
	while(e.nom_cientifico <> 'zzz') do begin
		write(archivo,e);
		leerEspecie(e);
	end;
end;
procedure imprimirCantidad(var archivo:arch_especie);
begin
	seek(archivo,0);
	writeln('cantidad de archivos: ', filesize(archivo));	
end;
procedure imprimirMaxMin(var archivo:arch_especie);
begin max,min:real; e:especie;
	seek(archivo,0);
	max:=-9999;
	min:=9999;
	while( not eof(archivo)) do begin
		readln(archivo,e);
		if(e.alt_max > max) then
			max:=e.alt_max;
		else ( e.alt_max < min) then 
			min:=e.alt_max;
	end;
	writeln('maxima altura: ', max:2:2);
	writeln('minima altura', min:2:2);
end;
var nom_arch:str20; archivo:arch_especie;
begin
readln(nom_arch);
assign(archivo,nom_arch);
cargaArchivo(archivo);

close(archivo);
WriteLn('========= MENÚ DE ARCHIVOS TEXT =========');
    WriteLn('1. Crear archivo');
    WriteLn('2. Escribir en archivo (sobrescribe)');
    WriteLn('3. Leer archivo');
    WriteLn('4. Agregar al archivo');
    WriteLn('5. Salir');
    Write('Elegí una opción: ');
    ReadLn(opcion);

    case opcion of
      1: CrearArchivo;
      2: EscribirArchivo;
      3: LeerArchivo;
      4: AgregarArchivo;
      5: WriteLn('Saliendo...');
    else
      WriteLn('Opción inválida. Presioná una tecla para continuar...');
    end;

end

