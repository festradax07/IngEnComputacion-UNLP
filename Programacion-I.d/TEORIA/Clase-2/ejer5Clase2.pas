{
Escribir un programa que informe la superficie total de una parcela de terrenos cuyas dimensiones se leen de teclado. 
La parcela se compone de 15 terrenos. 

}

program ejer5Clase2;
const cant = 15;
var frente, fondo, superficie, supParcela: real;
    i: integer;
begin
  supParcela:= 0;
  for i:= 1 to cant do
  begin
   write (' Ingrese frente: '); 
   readln(frente);  
   write (' Ingrese fondo: ');
   readln(fondo);  
   superficie:= frente * fondo;
   supParcela:= supParcela+superficie;
  end;
  writeln ('La superficie de la parcela es: ', supParcela:2:2);
End.
