program ej3;
var archivo: Text; nom_archivo,dino:string[30];
begin
	read(nom_archivo);
	assign(archivo,nom_archivo);
	rewrite(archivo);
	readln(dino);
	while( dino <> 'zzz') do begin
		writeln(archivo,dino);
		readln(dino)
	end;
	close(archivo);
end.
