program ej6;
uses crt;
var peso,min,max,totalMayor5,totalMenor5:real; cantmenor5,cantmayor6,mesEmbarazo:integer;
begin
    max:=-1; min:= 99999;totalMayor5:=0;totalMenor5:=0;cantmenor5:=0;cantmayor6:=0;
    writeln('introduzca el mes de su embarazo.');
    readln(mesEmbarazo);
    while ((mesEmbarazo > 0) and (mesEmbarazo < 10)) do begin
        writeln('introduzca su peso actual.');
        read(peso);
        if(mesEmbarazo <= 5) then begin
            if( peso < min) then
                min:=peso;
            totalMenor5:= totalMenor5 + peso;
            cantmenor5:= cantmenor5 + 1;
        end
        else if(mesEmbarazo > 6) then begin
            if( peso > max) then
                max:=peso;
            totalMayor5:= totalMayor5 + peso;
            cantmayor6:= cantmayor6 + 1;
        end;
        writeln('introduzca el mes de su embarazo.');
        read(mesEmbarazo);
    end;
    writeln('promedio menor/igual a 5 meses: ', (totalMenor5/cantmenor5):2:2);
    writeln('promedio mayor a 6 meses: ', (totalMayor5/cantmayor6):2:2);
    writeln(' max peso en mayor a 6 meses: ', max:2:2);
    writeln(' min peso en menor igual a 5 meses: ', min:2:2);
end.