program p2ej1;
const tam=10; valorAlto=9999;
type {10 archivos detalle por direcciones}
	str10=string[10];
	rLicencia=record
		codEmpl:integer;
		fecha:str10;
		diasLicencia:integer;
	end;
	rEmpleado=record
		codEmpl:integer;
		nomApe:string;
		fechaNac:str10;
		direccion:string;
		cantHijos:integer;
		telefono:str10;
		diasVacaciones:integer;
	end;
	tArchLicencia= File of rLicencia;
	tArchEmpleado= File of rEmpleado;
	solicitudes=text;
	detalles= array [1..tam] of tArchLicencia;
	rDetalles=array [1..tam] of rLicencia;
	//ordenados por codigo de empleado
procedure leer(var archivo:tArchLicencia; var dato:rLicencia);
begin
	if(not(eof(archivo))) then
		read(archivo,dato)
	else
		dato.codEmpl:=valorAlto;
end;
procedure minimo(var det:detalles;var regsd: rDetalles; var min:rLicencia);
var posMin:integer; // o(n)
begin
	posMin:=1;
	min:=regsd[1];
	for i:=2 to tam do begin
		if(regsd[i].codEmpl < min.codEmpl) then begin
			min:=regsd[i];
			posMin:=i;
		end;
	end;
	leer(det[posMin],regd[posMin]); // voy buscando el siguiente registro, ya que en minimo tengo el que voy a utilizar
end;
var mae:tArchEmpleado;regm:rEmpleado;det:detalles;regsd:rDetalles;min:rLicencia;soli:solicitudes;i,codAct:integer;
begin
assign(mae,'maestro.dat');
for i:=1 to tam do begin
	assign(det[i], 'ej1detalles' + Chr(i + 48) + '.dat'); // cuidado si i > 9
	reset(det[i]);
	leer(det[i],regsd[i]);
end;
reset(mae);
assign(soli,'informe.txt');
append(soli);
minimo(det,regsd,min);
read(mae,regm);
while (min.codEmpl <> valorAlto) do begin
	while(( not eof(mae)) and (regm.codEmpl <> min.codEmpl)) do
		read(mae,regm); 
	if( not eof(mae)) then begin
		codAct:=min.codEmpl;
		while(codAct = min.codEmpl)do begin
			if(regm.diasVacaciones < min.diasLicencia) then begin
				WriteLn(soli, regm.codEmpl, regm.nomApe, regm.diasVacaciones, min.diasLicencia);// archivo de texto
			end
			else begin
				regm.diasVacaciones:= regm.diasVacaciones - min.diasLicencia;
				minimo(det,regsd,min);
			end;	
		seek(mae,filePos(mae)-1);
		write(mae,regm); // me pasa a la siguiente
	end;		
end;
