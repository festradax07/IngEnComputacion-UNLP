{1. Realizar un algoritmo que cree un archivo binario de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde el teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del archivo
debe ser proporcionado por el usuario desde el teclado.}
Program ej1;
Type
	str25=String[25];
	str150=String[150];
		
	celular=record
		id:integer;
		nombre:str25;
		descripcion:str150;
		marca:str25;
		precio:real;
		stock_min:integer;
		stock_dis:integer;
	end;
	arch=file of celular;
Procedure cargarArchivo(var a:arch;var txt:text);
var c:celular;
begin
	reset(txt);
	rewrite(a);
	while(not EOF(a)) do begin
		readln(txt,c.id,c.precio,c.marca);
		readln(txt,c.stock_dis,c.stock_min,c.descripcion);
		readln(txt,c.nombre);
		write(a,c);
	end;
	close(a);
	close(txt);
end;

Procedure listarMenorStock(var a:arch);
begin
	reset(a);
	while(not EOF(a)) do begin
		read(a,c);
		if( c.stock_dis < c.stock_min)then
			ImprimirCelular(c);
	end;
	close(a);
end;
{ c) - cadena de caracteres por el usuario? imprimir las descripciones? }
Procedure ExportarArchivoTexto(var a:arch);
var txt:text; c:celular;
begin
	Assign(txt,'archivodeHoy.txt');
	reset(a);
	rewrite(txt);
	while(NOT EOF(a)) do begin
		read(a,c);
		writeln(txt,c.id,c.precio,c.marca);
		writeln(txt,c.stock_dis,c.stock_min,c.descripcion);
		writeln(txt,c.nombre);
	end;
	close(txt);
	close(a);
end;

Var
	a:arch; 
Begin
	Assign(a,'celulares.dat');
	

end.
