{1. Realizar un algoritmo que cree un archivo binario de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde el teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del archivo
debe ser proporcionado por el usuario desde el teclado.}
Program ej1;
Type
	arch= file of integer;
Var
	a:arch;n,cant:integer;prom:real;
Begin
	cant:=0; prom:=0;
	Assign(a,'numeritos.dat');
	Reset(a);
	while(not EOF(a))do begin
		Read(a,n);
		if(n<150) then 
			writeln(n);
		cant:=cant +1;
		prom:= prom + n;
	end;
	prom:=prom/cant;
	writeln('Son los elementos de archivo.dat ',cant);
	writeln('promedio:', prom);
end.
