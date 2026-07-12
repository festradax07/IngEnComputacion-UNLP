{Se quiere comprar un terreno solo si su superficie es mayor a 900 mts 2.
Implementar un programa que calcule la superficie del terreno cuyas dimensiones se leen e informe si lo compra o no}

program ejer1Clase2;
var frente, fondo, superficie: real;
begin
  write (' Ingrese frente: '); 
  readln(frente);  
  write (' Ingrese fondo: ');
  readln(fondo);  
  superficie:= frente * fondo;
  if (superficie > 900) then write('Comprar') 
                        else write('No comprar');
End.
