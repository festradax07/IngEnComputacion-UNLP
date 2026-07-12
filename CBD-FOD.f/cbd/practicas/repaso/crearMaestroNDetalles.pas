program crearMaestroNdetalles;
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

procedure crearMaestro(var maestro:ArchivoMaestro; var detalles: Detalles; var elems:rDetalles); // actualizacion maestro n detalles -> maestro,detalles, elems (rdetalles) y texto para reportes necesario.
var min,act:rDetalle; total_licencia:integer;
begin
minimo(detalles,elems,min); // me fijo cual es el menor para ir leyendo
while(min.cod_emp <> VALOR_ALTO) do begin // mientras no lea todos
	total_licencia:=0;
	act:= min; // 
	while(act.cod_emp=min.cod_emp) do begin // trato repetidos
		total_licencia:= total_licencia + min.dias_licencia;
		minimo(detalles,elems,min);
	end;
	// despues de totalizar y acumular del mismo codigo(gracias a minimo puede ser de distinto archivo), estoy listo para insertarlo en mi archivo
		act.dias_licencia:= total_licencia; // suponiendo que el maestro sea del mismo tipo del detalle
		write(maestro,rMae); // sumo el elemento en maestro
	end;
end;
end;

var maestro:ArchivoMaestro; i:integer;dets:Detalles;elems:rDetalles; texto:text;
//programa principal
begin
assign(maestro,'ej1maestro.dat');
rewrite(maestro); // esta vez lo estoy creando
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
