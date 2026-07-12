program actMaeNdetalles;
uses sysutils;
const CANT_DETALLES=10;
VALOR_ALTO=9999;
type
	str20=String[20];
	str8=String[8];
	Empleado=record
		cod_emp:integer;
		nombre:str20;
		apellido:str20;
		direccion:str20;
		telefono:str20;
		fecha_nac:str8;
		dias_vacaciones:integer;
	end;
	rDetalle=record
		cod_emp:integer;
		fecha:str8;
		dias_licencia:integer;
	end;
	// ordenados x cod_emp
	ArchivoDetalle= file of rDetalle;
	ArchivoMaestro= file of Empleado;
	Detalles= array [1..CANT_DETALLES] of ArchivoDetalle;
	rDetalles= array [1..CANT_DETALLES] of rDetalle;
procedure leer(var archivo:ArchivoDetalle; var elemDetalle:rDetalle);
begin
	if(not(EOF(archivo))) then
		read(archivo, elemDetalle)
	else
		elemDetalle.cod_emp:= VALOR_ALTO;
end;
procedure minimo(var det: Detalles; var rdet:rDetalles;var min:rDetalle);
 Var posMin,i:integer;
 Begin
 posMin:=1;
 min := rdet[1]; // asumo al primero como minimo y lo hago "competir"
 for i:=2 to CANT_DETALLES do begin
	 if(rdet[i].cod_emp < min.cod_emp)then begin 
		 min:= rdet[i];
		 posMin:=i;
	 end;
 end;
 leer(det[posMin],rdet[posMin]); // despues de calcular el minimo, se pisa en el arreglo de elementos con un leer.
end;

procedure actualizar(var maestro:ArchivoMaestro; var detalles: Detalles; var elems:rDetalles;var texto:text); // actualizacion maestro n detalles -> maestro,detalles, elems (rdetalles) y texto para reportes necesario.
var min,act:rDetalle; rMae:Empleado; total_licencia:integer;
begin
minimo(detalles,elems,min); // me fijo cual es el menor para ir leyendo
read(maestro,rMae);// leo un primer elemento de mi archivo
while(min.cod_emp <> VALOR_ALTO) do begin // mientras no lea todos
	total_licencia:=0;
	act:= min; // 
	while (not EOF(maestro)) and (rMae.cod_emp <> act.cod_emp) do begin // mientras no llegue al elemento que quiero modificar, voy saltando en el maestro.
		read(maestro,rMae);
	end;
	if( not eof(maestro)) then begin
		while(act.cod_emp=min.cod_emp) do begin // trato repetidos
			total_licencia:= total_licencia + min.dias_licencia;
			minimo(detalles,elems,min);
		end;
		if(rMae.dias_vacaciones < total_licencia) then // si no cumple entonces
			writeln(texto, rMae.cod_emp, ' ', rMae.nombre, ' ', rMae.apellido, ' ', rMae.dias_vacaciones, ' ', total_licencia) // lo coloco en el archivo
		else begin
			rMae.dias_vacaciones:= rMae.dias_vacaciones -total_licencia;
			seek(maestro, filePos(maestro)-1); // vuelvo para atrás en la ultima lectura donde encontré al elem
			write(maestro,rMae); // actualizo el elemento en maestro
		end;
	end;
end;
end;

var maestro:ArchivoMaestro; i:integer;dets:Detalles;elems:rDetalles; texto:text;
//programa principal
begin
assign(maestro,'ej1maestro.dat');
reset(maestro);
for i:=1 to CANT_DETALLES do begin
	assign(dets[i], 'ej1detalles' + IntToStr(i) + '.dat'); // cuando los inicializo les pongo nombre, reset(abrir los archivos)
	reset(dets[i]);
	leer(dets[i],elems[i]);
end;
assign(texto,'insuficientes_dias.txt');
append(texto);
actualizar(maestro,dets,elems,texto);
for i:=1 to CANT_DETALLES do begin // cierro todos los archivos
	close(dets[i]);
end;
close(texto);
close(maestro);
end.
