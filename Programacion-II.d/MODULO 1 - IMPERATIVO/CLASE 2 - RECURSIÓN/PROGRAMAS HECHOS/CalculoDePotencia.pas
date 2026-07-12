program CalculoDePotencia;
Function potencia (x,n: integer): integer;
begin
  if(n=0) then
  potencia:=1
  else
      potencia := x * potencia(x,n-1)
end;


{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln('potencia:', potencia(x,n) );
     readln;
end.
