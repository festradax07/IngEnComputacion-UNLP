program ej5;
uses crt;
const botellas = 12;
var vol,voltotal,min1,min2,max1,max2:real; masde2000,max1Id,max2Id,min1Id,min2Id,i:integer;
begin
    voltotal:=0; masde2000:=0;
    max1:=-1; max2:=-1; min1:= 99999; min2:=99999;
    for i:= 1 to botellas do begin
        writeln('introduzca el volumen de la botella numero ', i, '(cm³)');
        read(vol);
        if(vol > max1) then begin
            max2:= max1;
            max1:= vol;
            max1Id:= i;
        end
        else if(vol > max2) then begin
            max2:=vol;
            max2Id:=i;
        end;
        if( vol < min1) then begin 
            min2:=min1;
            min1:=vol;
            min1Id:= i;
        end
        else if(vol < min2) then begin
            min2:= vol;
            min2Id:=i;
        end;
        if( vol > 2000) then
            masde2000:= masde2000 + 1;
        voltotal:= voltotal + vol;
    end;
    writeln('promedio: ', (voltotal/botellas):2:2);
    writeln('porcentaje de botellas mayor a 2000cm³', (masde2000/botellas*100):2:2);
    writeln(' max1: ', max1:2:2, ' max2 ', max2:2:2 ,' min1: ', min1:2:2 ,' min2 ', min2:2:2);
    writeln(' idmax1: ', max1Id, ' idmax2: ',max2Id, ' idmin1: ', min1Id , ' idmin2: ',min2Id);

end.