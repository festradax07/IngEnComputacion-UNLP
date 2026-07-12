{Realizar un programa que permita crear un archivo conteniendo información de
nombres de materiales de construcción, el archivo no es ordenado. Efectúe la
declaración de tipos correspondiente y luego realice un programa que permita la
carga del archivo con datos ingresados por el usuario. El nombre del archivo debe
ser proporcionado por el usuario. La carga finaliza al procesar el nombre ‘cemento’
que debe incorporarse al archivo.}
program ej1; {cambiar por text}
const CORTE='cemento';
var arch_name,materiales: string[20];arch_Materiales:file of string[20];
begin
	readln(arch_name);
	assign(arch_materiales,arch_name);
	rewrite(arch_materiales);
	writeln('escribe un material');
	readln(materiales);
	while(materiales <> CORTE) do begin
		write(arch_materiales,materiales);
		writeln('escribe otro material');
		readln(materiales);
	end;
	close(arch_materiales);
	
	{prueba de lectura}
	assign(arch_materiales,arch_name);
	reset(arch_materiales);
	while ( not eof(arch_materiales)) do begin
		read(arch_materiales, materiales);
		write('material', materiales);
	end;
	close(arch_materiales);
end.
