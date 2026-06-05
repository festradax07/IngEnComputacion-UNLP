Program ej5;
{NOTA: CADA DETALLE ESTA ORDENADO POR CODIGO USUARIO Y FECHA
UN USUARIO PUEDE INICIAR SESION MAS DE UNA VEZ EL MISMO DIA EN UNA MAQUINA O VARIAS
MAESTRO SE CREA EN /VAR/LOG en el fs}
uses crt;
const VALORALTO=9999; MAQUINAS=5
Type
fecha=record
dia:integer;
mes:integer;
anio:integer;
end;
log=record
cod;integer;
fechal:fecha;
logtime:integer; {supongamos calculada en segundos como unidad minima}
end;

archivologs= file of logs;
arr_detalles= array[1..MAQUINAS] of archivologs;
arr_regs=array[1..MAQUINAS] of log;
 
procedure leer (var archivod:archivologs, var dato:log);
var
begin
if (not eof(archivod)) then
	read(archivod,dato)
else
	dato.cod:=VALORALTO;
end;

procedure initDetalles (var archD:arr_detalles; var regs:arr_regs);
var i:integer; nombre:str50;
begin
	for i:= 1 to MAQUINAS do begin
		Str(i,nombre);
		assign(archD[i],'ej5_detalle_'+nombre);
		reset(archD[i]);
		leer(archD[i],regs[i]); {cargo el primer elemento del archivo det en la pos correspondiente}
	end;
end;

procedure closeDetalles(var archD:arr_detalles);
var i:integer;
begin
	for i:=1 to MAQUINAS do begin
		close(archD[i]);
	end;
end;
function fechaMenor(f1, f2: fecha): boolean;
begin
    if (f1.anio < f2.anio) then fechaMenor := true
    else if (f1.anio > f2.anio) then fechaMenor := false
    else if (f1.mes < f2.mes) then fechaMenor := true
    else if (f1.mes > f2.mes) then fechaMenor := false
    else fechaMenor := (f1.dia < f2.dia);
end;
procedure minimo (var archsd:arr_detalles; var regs:arr_regs; var min:log);
var i,pos:integer;
begin
	min.cod:= VALORALTO;
	pos:=-1;
	for i:= 1 to MAQUINAS do begin
		if (regs[i].cod < min.cod) or 
		((regs[i].cod = min.cod) and (regs[i].cod <> VALORALTO)
		 and fechaMenor(regs[i].fechal, min.fechal)) then
		then begin {busco el registro minimo y su pos, desempatando por fecha}
			min.cod:= regs[i].cod;
			pos:=i;
		end;
	end;
	if(pos <> -1) then begin
		min:= regs[pos]; {me llevo el minimo actual}
		leer(archD[pos],regs[pos]); {leo el siguiente elemento del archivo minimo que ya lei y lo coloco en el arreglo}
	end;
end;

function validarFecha(fecha1:fecha,fecha2:fecha):boolean
begin
	if (fecha1.dia = fecha2.dia) and (fecha1.mes= fecha2.mes) and (fecha1.anio=fecha2.anio) then
		validarFecha:=true
	else
		validarFecha:=false
end;
procedure mergeMaestro(var archm:archivolog, var archsd:arr_detalles, var regs:arr_regs);
var min,actual:log;
begin
	rewrite(archm);
	minimo(archd,regs,min);
	while(min.cod <> VALORALTO)do begin
		actual.cod:=min.cod;
		while( min.cod = actual.cod) do begin
			actual.fechal:= min.fechal;
			total:=0;
			while (min.cod = actual.cod) and( validarfecha(actual.fechal,min.fechal)) do begin	
				total:= total + min.logtime;
				minimo(archsd,regs,min);
			end;
			actual.logtime:=total;
			write(archm,actual);
		end;
	end;
	writeln('archivo maestro creado');
	closeDetalles(archsd);
	close(archm);
end;

var archm:archivolog, archsd:arr_detalles; regs:arr_regs;
begin
	assign(archm,'/var/log/ej5_maestro.dat');
	initDetalles(archsd,regs);
	mergeMaestro(archm,archsd,regs);
end;
	
