{1. Realizar un algoritmo que cree un archivo binario de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde el teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del archivo
debe ser proporcionado por el usuario desde el teclado.}
Program ej1;
Type
	arch= file of integer;
Var
	a:arch;n:integer;
Begin
	Assign(a,'numeritos.dat');
	Reset(a);
	while(not EOF(a))do begin
		Read(a,n);
		writeln(n);
	end;
	writeln('Son los elementos de archivo.dat');
end.
