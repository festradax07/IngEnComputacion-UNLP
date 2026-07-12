program CalculoDeFactorial;

Function factorial(x: integer): integer;
begin
  if (x <= 1) then {SI EL X ES 1}
    factorial:= 1
  else
    factorial := x * factorial(x-1) {SI EL X ES MAYOR A 1, LO MULTIPLICA POR EL X-1 Y ASI HASTA SER X=1}
end;


{PROGRAMA PRINCIPAL}
var
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  while (num <>0) do begin
  writeln ( num, '! = ', factorial(num));
   writeln( 'ESCRIBI OTRO ( NO 0):');
  readln (num);
  end;
  writeln( '--FINALIZADO--');
  readln;
End.

