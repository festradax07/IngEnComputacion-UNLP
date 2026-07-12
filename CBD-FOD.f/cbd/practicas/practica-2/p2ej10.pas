program p2ej10;
const valorAlto=9999;TAM=8;
type
	productos=record
		codProd:integer;
		nomComercial:string;
		descripcion:string;
		precioVenta:real;
		cantidadVendida:integer;
		mayorCantMes:integer;
	end;
	ventas=record
		codProd:integer;
		cantidadVendida:integer;
	end;
	ArchMaestro= file of productos;
	ArchDetalle= file of ventas;
	Detalles= array [1..TAM] of ArchDetalle;
	rDetalles=array [1..TAM] of ventas;
procedure leer( var archivo:ArchDetalle; var dato:ventas);
begin
	if (not(EOF(archivo))) then 
		read(archivo,dato)
	else
		dato.cod:=valoralto;
end;
procedure minimo(var det:Detalles;var regsd: rDetalles; var min:ventas);
var posMin:integer; // o(n)
begin
	posMin:=1;
	min:=regsd[1];
	for i:=2 to TAM do begin
		if(regsd[i].codEmpl < min.codEmpl) then begin
			min:=regsd[i];
			posMin:=i;
		end;
	end;
	leer(det[posMin],regd[posMin]); // voy buscando el siguiente registro, ya que en minimo tengo el que voy a utilizar
end;
procedure actualizacion (var det:Detalles;var regm:productos; var mae:ArchMaestro;var rdets: rDetalles; var min:ventas);
var codAct,totalxMes:integer;
begin
minimo(dets,rdets,min);
while(min.cod <>valorAlto) do begin
	read(mae,regm);
	codAct:= min.cod;
	totalxMes:=0;
	while(min.cod<>valorAlto) and (codAct= min.cod) do begin
		totalxMes:= totalxMes + min.cantidadVendida;
		minimo(dets,rdets,min);
	end;
	while(not eof(mae)) and ( regm.codProd <> codAct) do begin
		read(mae,regm);
	end; // avanzo
	if( not eof(mae)) then begin 
		regm.cantidadVendida:= regm.cantidadVendida + totalxMes;
		if( totalxMes > regm.mayorCantMes) then begin 
		// informaria por pantalla data
		regm.mayorCantMes:= totalxMes;
		end;
		seek(mae, filepos(mae)-1)
		write(mae,regm);
	end;
	 
end;

var mae:ArchMaestro; dets:Detalles; rdets:rDetalles; regm:productos;
begin
assign(mae,'maestro');
reset(mae);
for i:=1 to 8 do begin
	assign(dets[i], 'detalle' + chr(i+48) + '.dat');
	reset(dets[i]);
	leer(dets[i],rdets[i]);
end;
actualizacion()
for i:=1 to TAM do begin 
	close(dets[i]);
end;
close(mae);
end.
