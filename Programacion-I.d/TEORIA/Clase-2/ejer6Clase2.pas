{
Escribir un programa que informe la superficie total de una parcela de terrenos cuyas dimensiones se leen de teclado. 
La parcela se compone de 15 terrenos. 

Reescribir el programa anterior para que además informe la superficie máxima calculada.
}

program ejer6Clase2;
const cant = 15;
var frente, fondo, superficie, supParcela, superficieMaxima: real;
    i: integer;
begin
  supParcela:= 0;
  superficieMaxima:= -1;
  for i:= 1 to cant do
  begin
   write (' Ingrese frente: '); 
   readln(frente);  
   write (' Ingrese fondo: ');
   readln(fondo);  
   superficie:= frente * fondo;
   supParcela:= supParcela+superficie;
   if (superficie > superficieMaxima)
   then superficieMaxima:= superficie
  end;
  writeln ('La superficie de la parcela es: ', supParcela:2:2);
  writeln ('La superficie maxima es: ', superficieMaxima:2:2);
End.
