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
Procedure buscarExistente(var a:FileEmp,id:integer, existe:boolean);
var actEmp:Empleado;
begin
	Reset(a);
	while((not EOF(a)) && (not existe)) do begin
		read(a,actEmp);
		if(actEmp.id = e,id) then
			existe:=true;
	end;
	close(a);
end;
Procedure AñadirNuevosEmpleados(var a:FileEmp);
var	e:Empleado; existe:boolean;
begin
		existe:=false;
		Reset(a);
		seek(a,filesize(a)); // final del archivo
		leerEmpleado(e);
		while(e.apellido <>'fin') do begin
			buscarExistente(a,e.id,existe);
			write(a,e);
			leerEmpleado(e);
		end;
		close(a);
end;
Procedure ModificarEdad(var a:FileEmp; edad:integer;id:integer);
var
begin
	reset(a);
	exist:=false;
	buscarExistente(a,e,existe);
	if(existe) then begin
		read(a,e);
		while(e.id <>id) do begin
			read(a,e);
		end;
		seek(a,filepos(a)-1); //vuelvo al anterior que lei
		e.edad:=edad;
		write(a,e);
	end;
	close(a);
end;
Procedure BintoText(var a:FileEmp);
var e:Emp; txt:text;
begin
	Assign(txt, 'Empleados.txt');
	reset(a);
	rewrite(txt);
	while(not eof(a)) do begin
		read(a,e);
		WriteLn(txt,e.id,' ',e.dni,' ',e.nombre,' ',e.apellido,' ',e.edad);
	end;
	close(txt);
	close(a);
end;

Procedure FaltaDnitoText(var a:FileEmp);
var e:Emp;txt:text;
begin
	Assign(txt,'FaltanDni.txt');
	reset(a);
	rewrite(txt);
	while( not eof(a)) do begin
		read(a,e);
		if(e.dni=0) then
			Writeln(txt,e.id,' ',e.dni,' ',e.nombre,' ',e.apellido,' ',e.edad);
	end;
	close(txt);
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
