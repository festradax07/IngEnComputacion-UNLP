{
Escribir un programa que informe la suma de 20 números enteros que se leen de teclado y además 
que informe la cantidad de números pares entre los números leídos.

}

program ejer7Clase2;
const cant = 20;
var
  num, suma, cantPares, i: integer;
begin
  suma:= 0;
  cantPares:= 0;
  for i:= 1 to cant do
  begin
    write ('Ingrese un numero: ');
    readln (num);
    suma:= suma + num;
    if (num mod 2 = 0) then cantPares:= cantPares + 1;
  end;
  writeln ('Suma de los numeros leidos: ', suma);
  write ('Cantidad de numeros pares leidos: ', cantPares);
end.
    
    
