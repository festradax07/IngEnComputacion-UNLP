Program ej7;
type
	str25=String[25];
	novela=record
		id:integer;
		precio:real;
		genero:str25;
		nombre:str25;
	end;
	arch=file of novela;

Procedure TextToBin(var txt:text, var a:arch);
var	n:novela;
begin
	//se asume abierto desde afuera
	reset(txt);
	rewrite(a);
	while( not EOF(txt)) do begin
		readln(txt,n.id,n.precio,n.genero);
		readln(txt,n.nombre);
		write(a,n);
	end;
	close(txt);
	close(a);
end;

Procedure ActualizarArchivo(var a:arch, n:novela);
var opcion:integer; act:novela;
begin
	reset(a);
	writeln('desea agregar una novela o modificar? 1-agregar, 2-modificar');
	read(opcion);
	if(opcion=1) then begin
		seek(a,filesize(a));
		writeln (a,n);
	end
	else begin
		read(a,act); {se asume existente?}
		while(act.id <> n.id) do begin
			read(a,act);
		end;
		seek(a,filepos(a) -1);
		write(a,n);
	end;
	close(a);
end;

