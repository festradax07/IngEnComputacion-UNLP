program p1ej2;
var archivo_votantes: file of integer; cantidad, min_votantes,max_votantes,num,i: integer; nom_archivo: string[20];
begin
	writeln (' ');
    writeln('Ejercicio 2');
    writeln('----');

    //Creacion del archivo de numeros para despues poder leer
    writeln ('Ingrese el nombre del archivo: ');
    readln(nom_archivo);
    assign(archivo_votantes,nom_archivo);
    rewrite(archivo_votantes);
    
    //Escritura sobre el archivo
    Randomize; //inicaliza el generador de numeros aleatorios con una semilla
    num:= Random(100) + 1 ; // genera un nro aleatorio entre 1 y 100
    writeln('El numero random es: ' , num); 
    for i := 1 to 50 do begin
        write(archivo_votantes, num);
        num:= Random(100) + 1 ; // genera un nro aleatorio entre 1 y 100 
    end;

    close(archivo_votantes);
	
	// segunda parte
	
	min_votantes:=9999;
	max_votantes:=-9999;
	read(nom_archivo);
	assign(archivo_votantes,nom_archivo);
	reset(archivo_votantes);
	read(archivo_votantes,cantidad);
	while( not eof(archivo_votantes)) do begin
		writeln('cantidad de votantes: ', cantidad);
		if(cantidad < min_votantes) then 
			min_votantes:=cantidad
		else if( cantidad > max_votantes) then
			max_votantes:=cantidad;
		read(archivo_votantes,cantidad);
	end;
	close(archivo_votantes);
	writeln('maxima cantidad de votantes: ', max_votantes);
	writeln('minima cantidad de votantes: ', min_votantes);
end.
