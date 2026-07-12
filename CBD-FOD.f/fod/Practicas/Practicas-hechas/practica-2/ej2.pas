Program ej2;
uses crt;
const VALORALTO=9999;
Type
	str50=string[50];
	Producto=record
	cod:integer;
	nombre:str50;
	preciov:real;
	stackact:integer;
	stockmin:integer;
	end;
	Venta=record
	codp:integer;
	uvendidas:integer;
	end;
	archivoM=file of Producto;
	archivoD=file of Venta;
procedure leer(var arch:archivoD;var dato:Venta);
begin
	if not eof(arch) then
		read(arch,dato)
	else
		dato.codp:=VALORALTO;
end;
procedure leerM(var arch:archivoM;var dato:Producto);
begin
	if not eof(arch) then
		read(arch,dato)
	else
		dato.cod:=VALORALTO;
end;

procedure actualizarMaestro(var archm:archivoM,var archd:archivoD);
var v:Venta;p:Producto; codact,total:integer; 
begin
		reset(archm);
		reset(archd);
		read(archm,p);
		leer(archd,v);
		while( v.codp <> VALORALTO) do begin
			codact:=v.codp;
			total:= v.uvendidas;
			leer(archd,v);
			while (codact = v.codp) do begin
				total:= total + v.uvendidas;
				leer(archd,v);
			end;
			while (p.cod <> codact) do begin
				read(archm,p);
			end;
			seek (archm,FilePos(archm)-1);
			p.stockact:= p.stockact - total;
			write(archm,p);
		end;
		close(archd);
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
var archm:archivoM;archd:archivoD;
begin
	assign(archm,'ej2_maestro.dat');
	assign(archd,'ej2_detalle.dat');
	actualizarMaestro(archm,archd);
	generarStockMinimo(archm);
end.
			
	
	

