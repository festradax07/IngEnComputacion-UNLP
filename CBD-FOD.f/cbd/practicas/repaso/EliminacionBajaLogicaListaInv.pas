program p3ej2; //utiliza lista invertida el archivo
const
type
	tVehiculo=record
		cod_vehiculo:integer;
		patente:String;
		motor:String;
		cant_puertas:integer;
		precio:real;
		descripcion:String;
	end;
	tArchivo=File of tVehiculo;
	// el valor '0' en descripción significa que no hay registros borrados, y 'n' indique que el proximo a reutilizar es el n
procedure agregar(var a:tArchivo; vehiculo:tVehiculo);
var pos:integer;rvehiculo:tVehiculo;
// si es 0 el valor del primer registro, no hay elementos para sobreescribir, por lo que deberia ir al final, sino, busco el elemento relativo
begin
reset(a);
read(a,rvehiculo);
if ( rvehiculo.descripcion = '0') then begin  // agrego al final
	seek(a,filesize(a));
	write(a,vehiculo);
end
else begin // busco espacio disponible
	pos:= StrToInt(rvehiculo.descripcion);
	seek(a,pos);
	read(a,rvehiculo); // tengo el dato
	seek(a, filepos(a)-1);
	write(a,vehiculo); // lo coloco en el espacio disponible
	seek(a,0);
	write(a,rvehiculo);
end;
close(arch);
end;
procedure eliminar(var a:tArchivo; codVehiculo:integer);
var posborrar:integer;posstr:String; rvehiculo, head:tVehiculo;
begin
	reset(a); //
	read(a,rvehiculo);
	head:=rvehiculo;
	while( not eof(a)) and(rvehiculo.cod_vehiculo<> codVehiculo) do begin
		read(a,rvehiculo);
	end
	if(rvehiculo.cod_vehiculo = codVehiculo) then begin
		posborrar:=filepos(a)-1;
		seek(a,posborrar);
		write(a,head);
		Str(posborrar,posstr);// entero a string
		head.descripcion:=posstr;
		seek(a,0);
		write(a,head);
	end;
	else
		writeln('no existe elemento con ese codigo de vehiculo en el archivo');
	close(a);
end;
