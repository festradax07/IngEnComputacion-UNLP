program ej3;
uses crt;
const partidos = 135;
var cantciudades,mas20000,max,min,canthabitantes,i:integer; promedio,totalHabitantes: real;
begin
    mas20000:=0;
    max:=-1;
    min:= 32700;
    totalHabitantes:=0;
    for i:=1 to partidos do begin
        readln(canthabitantes);
        if(canthabitantes <> 0) then
            readln(cantciudades);
        if(canthabitantes > max) then
            max:= canthabitantes;
        if (canthabitantes < min) then
            min:= canthabitantes;
            writeln(min);
        if(canthabitantes > 20000 ) then
            mas20000:= mas20000 + 1;
        totalHabitantes:= totalHabitantes + canthabitantes;
    end;
    promedio:= totalHabitantes / partidos;
    writeln(promedio:2:2);
    writeln('variable max: ',max,'datos min: ',min);
    writeln('mayores a 20000: ', mas20000);
    {a tener en cuenta: integer -> rango de rep -32768 a 32767.
    real -> mas rango de rep }
end.