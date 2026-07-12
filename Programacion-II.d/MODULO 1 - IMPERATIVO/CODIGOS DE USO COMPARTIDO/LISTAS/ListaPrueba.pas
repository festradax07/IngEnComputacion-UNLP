program ListaPrueba;
type
// Lista de enteros
 lista = ^nodoL;
 nodoL = record
   dato: integer;
   sig: lista;
 end;
// LIsta nivel


procedure agregarAdelante(var l: Lista; nro: integer);
var
 aux: lista;
begin
 new(aux);
 aux^.dato := nro;
 aux^.sig := l;
 l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
 n: integer;
begin
l:= nil;
n := random (20);
While (n <> 0) do Begin
  agregarAdelante(L, n);
  n := random (20);
End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
While (l <> nil) do begin
  write(l^.dato, ' - ');
  l:= l^.sig;
End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: lista): integer;
 var c: integer;
begin
c:= 0;
While (l <> nil) do begin
  c:= c+1;
  l:= l^.sig;
End;
contarElementos := c;
end;
procedure agregarOrdenado(var pri:lista; t:integer);
var
   nuevo, anterior, actual: lista;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato < nuevo^.dato) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;
procedure hacerListaOrd( var lOrd:lista; l:lista);
begin
 while( l<> nil) do begin
      agregarOrdenado(lOrd, l^.dato);
      l:= l^.sig;
 end;
end;

var l,lOrd:lista;
begin
  l:=nil;
  lOrd:=nil;
  crearLista(l);
  writeln(' CATN DE ELEMENTOS: ', contarElementos(l));
  WRITELN ( 'LISTA DE ELEMENTOS:  ');
  imprimirLista(l);
  writeln();
  WRITELN (' LISTA ORDENADA :  ');
  hacerListaOrd(lOrd,l);
  imprimirLista(lOrd);
  readln();

end.

