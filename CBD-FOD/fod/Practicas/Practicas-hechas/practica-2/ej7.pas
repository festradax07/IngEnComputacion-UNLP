Program ej7;
usaes crt;
const VALORALTO=9999;
TYPE
str10=string[10];
str60=string[60];
alumno=record {ordenado por cod alumno}
cod:integer;
nomape:str60;
curs_apr:integer;
final_apr:integer;
end;

materia=record
cod: integer; {alumno}
cod_mat:integer;
anio_cursada:integer;
res:boolean;
end;
{ordenador por cod alu, cod mate}
examen=record
cod:integer;
cod_mat:integer;
fecha_examen:str10;
nota:integer;
end;

det_finales=file of examen;
det_cursadas= file of materia;
mae_alu= file of alumno;

procedure leercur(var archc:det_cursadas,var dato:materia);
begin
	if (not eof(archc)) then
		read(archc,dato)
	else
		dato.cod=VALORALTO;
end;
procedure leerfin(var archf:det_finales,var dato:examen);
begin
	if (not eof(archf)) then
		read(archf,dato)
	else
		dato.cod=VALORALTO;
end;
procedure leerfin(var archm:mae_alu,var dato:alumno);
begin
	if (not eof(archm)) then
		read(archm,dato)
	else
		dato.cod=VALORALTO;
end;
function mincod(codC, codF: integer): integer;
begin
    if (codC < codF) then 
        proximoCodigo := codC
    else 
        proximoCodigo := codF;
end;

procedure actualizarMaestro(var archm:mae_alu, var df:det_finales; var dc:det_cursadas);
var	 actalu:alu; fin:examen; cur:materia; min:integer;
begin
	reset(df);
	reset(dc);
	reset(archm);
	leerM(archm,actualu);
	leercur(dc,cur);
	leerfin(df,fin);
	while(fin.cod <> VALORALTO) or (cur.cod <> VALORALTO) do begin
		min:= mincod(cur.cod,fin.cod);
		while (actualu.cod <> min) do begin
			leerM(archm,actualu);
		end; {lo hago en este punto para sobreescribir directo en el elemento}
		
		while(cur.cod = min) do begin
			if(cur.res) then
				actualu.curs_apr:= actualu.curs_apr + 1;
			leercur(dc,cur);
		end;
		while(fin.cod = min) do begin
			if(fin.nota >= 4) then
				actualu.final_apr:= actualu.final_apr + 1;
			leerfin(df,fin);
		end;
		seek(archm, FilePos(archm) -1);
		write(archm,actualu);
	end;
	close(archm);
	close(dc);
	close(df);
end;
var archm:mae_alu, df:det_finales; dc:det_cursadas;
begin
	assign(archm,'ej7_maestro.dat');
	assign(df,'ej7_dfinales.dat');
	assign(dc,'ej7_dcursadas.dat');
	actualizarMaestro(archm,df,dc);
end;
	
