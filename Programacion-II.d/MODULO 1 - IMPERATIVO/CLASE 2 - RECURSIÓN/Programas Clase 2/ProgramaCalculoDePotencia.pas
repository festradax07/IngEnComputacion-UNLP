program CalculoDePotencia;
Function potencia1 (x,n: integer): real;
begin
  potencia1 := x * potencia1(x,n-1)
end;


{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);
     writeln('potencia:', potencial(n,x));

     readln;
end.
