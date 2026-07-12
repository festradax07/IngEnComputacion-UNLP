program p3ej1;
type
	plantas=record
		codEsp:integer;
		nombreVulgar:string;
		nombreCientifico:string;
		alturaPromedio:real;
		descripcion:string;
		zonaGeografica:string;
	end;
	// no está ordenado bajo ningún criterio
	// eliminar las especies trepadoras, se debe recibir por teclado los cods de especies a eliminar
	ArchMaestro= file of plantas;
procedure MarcaeliminacionFisica1(var archivo:ArchMaestro,codigo:integer, var nuevo:ArchMaestro)
var regm:plantas;
begin
	reset(archivo); // orgine del maestro
	read(mae,regm)
	while(not(eof(mae))) and (regm.codPlanta <>codigo) do begin
		read(mae,regm)
	end;
	if(regm.codPlanta = codigo) then begin
		regm.codPlanta:= -1; // sé que todos las plantas con cod -1 en el archivo son despreciables.
		seek(mae,filepos(mae) -1);
		write(mae,regm);
	end;
	// vuelvo al origen del maestro, porque no está ordenado y aun así es impredecible por estar leyendo de teclado.
end;
procedure eliminacionFisica1(var archivo:ArchMaestro, var nuevo:ArchMaestro);
var regm:plantas;
begin
	// suponiendo al archivo ya creado e iniciado en ppal
	read(mae,regm)
	while(not(eof(mae)) do begin
		if(regm.codPlanta <> -1) then write(nuevo,regm);
		read(mae,regm);
	end;
end;
procedure bajaFisica1(var archivo:ArchMaestro, var nuevo:ArchMaestro);
var codigo:integer;
begin
	read(codigo);
	while(codigo<>10000) do begin
		MarcaeliminacionFisica1(archivo,codigo);
		read(codigo);
	end;
	eliminacionFisica1(archivo,nuevo);
	writeln('Eliminaciones realizadas exitosamente');
end;
procedure eliminacionFisica2(var archivo:ArchMaestro, codigo:integer);
var posBorrado:integer, regm,aux:plantas;
begin
reset(a);
read(mae,regm);
while(not eof(a) and (regm.codPlanta <> codigo)) do begin
	read(a,regm);
end;
if(regm.codPlanta=codigo) then begin
	posBorrar:=filepos(a)-1;
	seek(a,filesize(a)-1);
	read(a,aux); // ultimo elemento
	seek(a,posBorrado);// vuelvo
	write(a,aux) // sobreescribo el elemento a borrar
	seek(a,filesize(a)-1);
	truncate(a);
end;
end;
	

end;

