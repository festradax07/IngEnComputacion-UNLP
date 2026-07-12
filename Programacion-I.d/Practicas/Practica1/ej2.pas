program ej2;
uses crt;
var valores,horamax,max,i:integer;
begin
    max:= -1;
    for i:= 0 to 23 do begin
        readln(valores);
        if(valores > max) then begin
            max:=valores;
            horamax:= i;
        end;
    end;
    writeln('maxima cantidad de animales en una hora: ',max,' en la hora: ', horamax);
    readln();
end.