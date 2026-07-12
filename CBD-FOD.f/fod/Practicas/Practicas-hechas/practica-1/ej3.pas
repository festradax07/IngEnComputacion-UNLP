{1. Realizar un algoritmo que cree un archivo binario de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde el teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del archivo
debe ser proporcionado por el usuario desde el teclado.}
Program ej1;
Type
	str25=String[25];
	Empleado= record
		id:integer;
		nombre:str25;
		apellido:str25;
		edad:integer;
		dni:integer;
	end;

	FileEmp= file of Empleado;
Procedure leerEmpleado(var e:Empleado);
begin
	read(e.apellido);
	if(e.apellido <> 'fin') then begin
		read(e.nombre);
		read(e.id);
		read(e.edad);
		read(e.dni);
	end;
end;
Procedure imprimirEmpleado(e:empleado);
begin
	write(e.id);
	write(e.nombre);
	write(e.apellido);
	write(e.edad);
	write(e.dni);
	writeln();
end;

Procedure crearArchivoEmpleado(var a:FileEmp);
var e:Empleado;
Begin
	Rewrite(a);	
	leerEmpleado(e);
	while( e.apellido  <> 'fin') do begin
		Write(a,e);
		leerEmpleado(e);
	end;
	close(a);
	writeln('leidos los empleados');
end;
Procedure Buscar(nombre:str25; var a:FileEmp);
var e:Empleado;
Begin
	Reset(a);
	writeln('los empleados con nombre o apellido ', nombre , 'son:');
	while(not EOF(a)) do begin
		read(a,e);
		if(e.nombre = nombre) or (e.apellido = nombre) then
			ImprimirEmpleado(e)
	end;
	close(a);
end;
Procedure imprimirListado(var a:FileEmp);
var e:Empleado;
begin
	Reset(a);
	writeln('Empleados:');
	while ( not EOF(a)) do begin
		read(a,e);
		ImprimirEmpleado(e);
	end;
	close(a);
end;
Procedure Mayores70(var a:FileEmp);
var e:Empleado;
begin
	Reset(a);
	writeln('Empleados mayores de 70 años');
	while(not EOF(a)) do begin
		read(a,e);
		if(e.edad>70) then
			ImprimirEmpleado(e)
	end;
	close(a);
end;
Var
        a:FileEmp;e:Empleado;nombreArch,nombre:str25;
Begin
	read(nombreArch);
	Assign(a,nombreArch);
	crearArchivoEmpleado(a);
	imprimirListado(a);
	read(nombre);
	Buscar(nombre,a);
	Mayores70(a);
end.
