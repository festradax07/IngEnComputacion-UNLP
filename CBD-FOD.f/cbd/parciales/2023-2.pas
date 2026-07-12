program parcial1;
const CANT_DETALLES=500;
	  VALOR_ALTO=9999;
type
	rMaestro=record
		cod_prov:integer;
		cod_loc:integer;
		nom_prov:String;
		votos_blancos:integer;
		votos_anulados:integer;
		votos_validos:integer;
	end;
	rDetalle=record
		cod_prov:integer;
		cod_loc:integer;
		votos_blancos:integer;
		votos_anulados:integer;
		votos_validos:integer;
	end;
	AMaestro=file of rMaestro;
	ADetalle=file of rDetalle;
	Detalles= array[1..CANT_DETALLES] of ADetalle;
	rDetalles= array[1..CANT_DETALLES] of rDetalle;

procedure leer(var Adet:ADetalle; var dato:rDetalle);
begin
	if(not eof(Adet))then
		read(Adet,dato)	
	else
		dato.cod_prov:=VALOR_ALTO;
end;


procedure minimo(var Adets:Detalles; var elems:rDetalles;var min:rDetalle );
var posmin,i:integer;
begin
		posmin:=1;
		min:= elems[1]; // lo hago competir con los otros
		for i:= 2 to CANT_DETALLES do begin
			if(elems[i].cod_prov< min.cod_prov) or ((elems[i].cod_prov = min.cod_prov) and (elems[i].cod_loc< min.cod_loc)) then begin
				min:=elems[i];
				posmin:=i;
			end;
		end;
		leer(Adets[posmin],elems[posmin]);
end;

procedure actualizar(var mae:AMaestro; var Adets:Detalles; var elems:rDetalles; var texto:text);
var min:rDetalle;rMae:rMaestro;tot_votos,tot_validos,tot_blancos,tot_anulados,tot_archivos,prov_act:integer;
begin
	tot_validos:=0;tot_anulados:=0;tot_archivos:=0;tot_blancos:=0;
	minimo(Adets,elems,min); // saco el primer valor
	read(mae,rMae); // primer reg
	while(min.cod_prov <>VALOR_ALTO) do begin
		prov_act:= min.cod_prov;
		while(not eof(mae)) and (rMae.cod_prov <> prov_act) do begin
			read(mae,rMae);
		end;
		while(min.cod_prov <>VALOR_ALTO) and ( prov_act= min.cod_prov) do begin
			tot_archivos:=tot_archivos + 1;
			tot_validos:=tot_validos + min.votos_validos;
			tot_anulados:=tot_anulados + min.votos_anulados;
			tot_blancos:=tot_blancos + min.votos_blancos;	// revisar por el contexto pedido del enunciado
			rMae.votos_validos:= rMae.votos_validos + min.votos_validos;
			rMae.votos_anulados:=rMae.votos_anulados + min.votos_anulados;
			rMae.votos_blancos:=rMae.votos_blancos + min.votos_blancos;
			minimo(Adets,elems,min); // voy añadiendo del mismo, hasta que en algun momento me quedo con el valor de otra prov siguiente
		end;
		seek(mae,filepos(mae)-1);
		write(mae,rMae); // actualizado
	end;
	tot_votos:= tot_anulados + tot_validos + tot_blancos;
	writeln(texto, 'cantidad de archivos procesados: ',tot_archivos);
	writeln(texto, 'cantidad de votos procesados: ',tot_votos);
	writeln(texto, 'cantidad de votos validos: ', tot_validos);
	writeln(texto, 'cantidad de votos anulados: ', tot_validos);
	writeln(texto, 'cantidad de votos en blanco: ', tot_blancos);
end;
var		
		



end;

		
