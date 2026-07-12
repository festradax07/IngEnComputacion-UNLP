program p3ej3;
const
type	
	str20=String[20];
	Producto=record
		cod_prod:integer;
		nombre:str20;
		descripcion:string;
		stock:integer;
	end;
	Archivo: file of Producto;

procedure cargaBinario(var a:Archivo; var texto:text);
var p:Producto;
rewrite(a);
append(texto);
while(not eof(texto)) do begin
	readln(texto,p.cod_prod,p.nombre,p.descripcion,p.stock);
	write(a,p);
end;
close(texto)
close(a);
end;
end;
// marca de borrado
procedure bajaMarcaEliminado (var a:Archivo;cod:integer);
var reg:Producto;
begin
	reset(a);
	read(a,reg);
	while(not eof(a)) and(reg.cod_prod <>cod) do begin
			read(a,reg);
	end;
	if(reg.cod_prod=cod) then begin
		reg.stock:= reg.stock*(-1);
		seek(a,filepos(a)-1);
		write(a,reg);
	end
	else
		writeln('no sé encontró el elemento con codigo ',cod, ' en el archivo');
	end;
	close(a);
end;

procedure darAlta(var a:Archivo;p:Producto);
var reg:Producto;
begin
	reset(a);
	read(a,reg);
	while(not eof(a)) and (reg.stock >=0) do begin
		read(a,reg);
	end;
	if(not eof(a)) then seek(a,filepos(a)-1);
	write(a,p);
end;

procedure bajaListaInvertida(var a: Archivo;cod:integer);
var	posborrar:integer;reg,head:Producto;
begin
	reset(a);
	read(a,reg);
	head:=reg;
	while(not eof(a)) and (reg.cod_prod <>cod) do begin
		read(a,reg);
	end;
	if(reg.cod_prod=cod) then begin
		posborrar:=filepos(a)-1;
		seek(a,posborrar);
		write(a,head);
		head.stock:= posborrar *-1;
		seek(a,0);
		write(a,head);
	end
	else
		writeln('no se pudo encontrar el elemento', cod ' en el archivo');
	end;
	close(a);
end;
var
	texto:text; a:Archivo;
