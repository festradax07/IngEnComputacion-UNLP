Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;
Var
 L: Lista;
 n: integer;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;


Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;

function Minimo(l:Lista; min:integer):integer;
begin
     if (l=nil) then
         Minimo:= min
     else begin
     if ( l^.Datos < min ) then begin
        min:= l^.Datos;
     end;
     Minimo:= Minimo(l^.Sig,min);
     end;
end;

Procedure ImprimirRECUR(l:Lista);
 begin
    if(l=nil) then
        writeln('fin :)')
    else begin
        writeln ( l^.Datos);
        ImprimirRECUR(l^.Sig);
    end;
 end;

begin
 L:=nil;
 randomize;
 n := random (100);
 While (n<>0) do Begin
   AgregarAdelante (L, n);
   n := random (100);
 End;
 writeln ('Lista generada: ');
 imprimir (L);
 writeln ( ' numero minimo', Minimo(L,9999));
 writeln ( ' LISTA IMPRESA: ', ImprimirRECUR(l));
 readln
end.
