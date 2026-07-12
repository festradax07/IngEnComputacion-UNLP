program Recursion;

var 
  num, maximo: integer;

function digitoMaximo(n: integer): integer;
var
  dig: integer; max: integer;
begin
  if( n = 0) then begin
    digitoMaximo:=0;
  end
  else begin
  dig:= n mod 10;
  max:= digitoMaximo(n div 10);
  if ( dig > max ) then
    max:= dig;
    digitoMaximo:=max;
  end;
end;

procedure digitoMax(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMax(n, max);
end;


Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  maximo:= digitoMaximo (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  readln;
End.
{a- cuando n=o}

