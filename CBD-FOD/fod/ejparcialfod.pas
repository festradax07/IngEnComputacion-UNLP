Program archivofod;
Type
VALORALTO=9999;
producto=record
	cod:integer;
	nom:str[40];
	descripcion:string;
	precio_v:real;
	precio_c:real;
	ubicacion:str[50];
end;
archivo_p:file of producto;


procedure leer (var archivo:archivo_p; var dato:producto);
begin
	if not eof(archivo_p) then
		read(archivo,dato);
	else
		dato.cod:=VALORALTO;
end;

procedure AgregarProducto (var archivo:archivo_p);
var
	head,nreg:productos;
begin
	reset(archivo);
	leerproducto(nreg); {lectura secuencial de campos}
	if(existeproducto(nreg.cod,archivo)) then begin
		leer(archivo,head);
		if(head.cod=0) then begin {agrego al final si no hay espacio para reasignar}
				seek (archivo, fileSize(archivo));
				write(archivo,nreg);
		end;
		else begin
			seek(archivo, (head.cod)*-1); {voy al espacio designado como disponible en head}
			read(archivo, head); {leo content para despues}
			seek(archivo, filePos(archivo)-1); {vuelvo sobre si}
			write(archivo,nreg); {coloco nuevo reg}
			seek(archivo,0);{vuelvo al head del file}
			write(archivo,head); {coloco el nuevo espacio disponible}
		end;
	else
		writeln('no existe el codigo');
	close(a);
end;

procedure quitarProducto(var archivo:archivo_p);
var
	dcod:integer;
	reg,head:productos;
begin
	reset(archivo);
	readln(dcod);
	if(existeproducto(dcod,archivo)) then begin
		leer(archivo,head);
		reg=head; {para arrancar desde el mismo}
		while(reg.cod<>dcod) do {como ya sé que existe no hace falta poner el while de valoralto}
			leer(archivo,reg);
		seek(archivo,filePos(archivo)-1;
		write(archivo,head);
		head.cod:= (filePos(archivo) -1)* -1;
		seek(archivo,0);
		write(archivo,head);
	else
		writeln('no existe el codigo');
	close(archivo);
end;
