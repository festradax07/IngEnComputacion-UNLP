program p2ej3;
const CANT_DETALLES=20;VALOR_ALTO=9999;
type
	str30=string[30];
	str10=string[10];
	Calzado=record
		cod_calzado:integer;
		numero:integer;
		descripcion:str30;
		precio_unitario:real;
		color:str10;
		stock_prod:integer;
		stock_min:integer;
	end;
	rDetalle=record
		cod_calzado:integer;
		numero:integer;
		cant_venta:integer;
	end;
	AMaestro=file of Calzado;
	ADetalle=file of rDetalle;
	ADetalles=array [1..CANT_DETALLES] of ADetalles;
	rDetalles=array[1..CANT_DETALLES] of rDetalle;
procedure leer(var archivo:Adetalle; var dato: rDetalle);
begin
	if(not eof(archivo)) then
		read(archivo,dato)
	else
		dato.cod_calzado:=VALOR_ALTO;
end;
procedure minimo (var detalles:ADetalles; var rdets:rDetalles,var min:rDetalle);
var posmin,i:integer
begin
	posmin:=1;
	min:=rdets[1];
	for i:=2 to CANT_DETALLES do begin
		if (rdets[i].cod_calzado < min.cod_calzado) or ((rdets[i].cod_calzado = min.cod_calzado) and (rdets[i].numero < min.numero)) then
			min:= rdets[i];
			posmin:=i;
		end;
	end;
	leer(detalles[posmin],rdets[posmin]);
end;
procedure actualizar(var mae:AMaestro;var detalles:ADetalles; var rdets:rDetalles, var texto:text);
var min,act:rDetalle;rMae:Calzado;tot_stock,ant_cod:integer;
begin
	minimo(detalles,rdets,min);
	read(mae,rMae);
	ant_cod:=-1;
	while(min.cod_calzado <> VALOR_ALTO) do begin
		while( not eof(mae)) and((rMae.cod_calzado < min.cod_calzado) or ((rMae.cod_calzado = min.cod_calzado) and (rMae.numero < min.numero))) do begin
			if(ant_cod <> min.cod_calzado) then begin
				writeln('CALZADO - codigo: ',rMae.cod_calzado, ' sin ventas');
				ant_cod:= rMae.cod_calzado;
			end
			else if (rMae.stock_act < rMae.stock_min) then
				writeln(texto,rMae.cod_calzado,rMae.numero,rMae.color,rMae.stock_min,rMae.stock_act)
			end;
			read(mae,rMae);
		end; // avanzo hasta llegar al calzado del numero
		if( not eof(mae))and (rMae.cod_calzado = min.cod_calzado) and (rMae.numero = min.numero)) then begin
			act:= min;
			while(act.numero= min.numero) do begin // trato repetidos del mismo calzado y numero
				tot_stock:= tot_stock + min.cant_venta;//totalizo
				minimo(detalles,elems,min);
			end;
			rMae.stock_act:= rMae.stock_act - tot_stock;
			seek(mae, filePos(mae)-1);
			write(mae,rMae); // actualizo el elemento en maestro
		end;
	end;
// me aburrí, pero habria que adaptarlo, si o si debo recorrer todo el maestro.
end;




