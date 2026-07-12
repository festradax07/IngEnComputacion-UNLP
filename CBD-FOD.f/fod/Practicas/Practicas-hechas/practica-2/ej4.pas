Program ej4;
uses crt;
const VALORALTO=9999; CANTSUCURSALES=30;
Type
	str50=string[50];
	Producto=record
	cod:integer;
	nombre:str50;
	preciov:real;
	stockact:integer;
	stockmin:integer;
	end;
	Venta=record
	cod:integer; {es codigo de producto}
	uvendidas:integer;
	end;
	archivoM=file of Producto;
	archivoD=file of Venta;
	arr_detalles = array[1..CANT_SUCURSALES] of archivoD;
    arr_registros = array[1..CANT_SUCURSALES] of Venta;
procedure leer(var arch:archivoD;var dato:Venta);
begin
	if not eof(arch) then
		read(arch,dato)
	else
		dato.cod:=VALORALTO;
end;
procedure leerM(var arch:archivoM;var dato:Producto);
begin
	if not eof(arch) then
		read(arch,dato)
	else
		dato.cod:=VALORALTO;
end;
procedure initDetalles (var archD:arr_detalles; var regs:arr_registros);
var i:integer; nombre:str50;
begin
	for i:= 1 to CANTSUCURSALES do begin
		Str(i,nombre);
		assign(archD[i],'ej4_detalle_'+nombre);
		reset(archD[i]);
		leer(archD[i],regs[i]); {cargo el primer elemento del archivo det en la pos correspondiente}
	end;
end;
procedure closeDetalles(var archD:arr_detalles);
var i:integer;
begin
	for i:=1 to CANTSUCURSALES do begin
		close(archD[i]);
	end;
end;
procedure minimo( var archD: arr_detalles; var  regs:arr_registros; var min:Venta);
var i,pos:integer;
begin
	min.cod:= VALORALTO;
	pos:=-1;
	for i:= 1 to CANTSUCURSALES do begin
		if (regs[i].cod < min.cod) then begin {busco el registro minimo y su pos}
			min.cod:= regs[i].cod;
			pos:=i;
		end;
	end;
	if(pos <> -1) then begin
		min:= regs[pos]; {me llevo el minimo actual}
		leer(archD[pos],regs[pos]); {leo el siguiente elemento del archivo minimo que ya lei y lo coloco en el arreglo}
	end;
end;


procedure actualizarMaestro(var archm:archivoM;var archd:arr_detalles; var regs:arr_registros);
var min:Venta;p:Producto; codact,total:integer; 
begin
		reset(archm);
		initDetalles(archd,regs);
		read(archm,p);
		minimo(archd,regs,min);
		while( min.cod <> VALORALTO) do begin
			codact:=min.cod;
			total:= min.uvendidas;
			minimo(archd,regs,min);
			while (codact = min.cod) do begin
				total:= total + min.uvendidas;
				minimo(archd,regs,min);
			end;
			while (p.cod <> codact) do begin
				read(archm,p);
			end;
			seek (archm,FilePos(archm)-1);
			p.stockact:= p.stockact - total;
			write(archm,p);
			{podria llamar aca al proceso que verificasi el stockact < stockmmin dandole p y archtxt o hacer proceso separado}
		end;
		closeDetalles(archd);
		close(archm);
end;
procedure generarStockMinimo (var archm:archivoM);
var p:Producto; txt:Text;
begin
	reset(archm);
	assign(txt,'stocks_minimos.txt');
	rewrite(txt);
	leerM(archm,p);
	while( p.cod <> VALORALTO) do begin
		if( p.stockact < p.stockmin) then
			writeln(txt, p.cod, ',',p.nombre,',',p.preciov,',',p.stockact,',',p.stockmin);
		leerM(archm,p);
	end;
	close(archm);
	close(txt);
end;
var archm:archivoM;archd:arr_detalles;regs:arr_registros;
begin
	assign(archm,'ej2_maestro.dat');
	actualizarMaestro(archm,archd,regs);
	generarStockMinimo(archm);
end.
