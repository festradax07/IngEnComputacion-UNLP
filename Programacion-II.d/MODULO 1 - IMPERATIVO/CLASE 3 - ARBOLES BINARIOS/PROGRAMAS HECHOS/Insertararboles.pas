Program Insertararboles;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;
{INSERTAR ARBOL}
procedure insertarArbol ( var a:arbol; dato:integer);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato:=dato;
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato > dato) then
      insertarArbol(a^.HI, dato)
    else
        if (a^.dato < dato) then
       insertarArbol(a^.HD,dato);
    end
end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
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
procedure crearLista(var l: lista);
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
procedure imprimirLista(l: lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:lista; d:integer);
var
   nuevo, anterior, actual: Lista;
begin
     new (nuevo);
     nuevo^.dato:= d;
     nuevo^.sig := nil;
     writeln('entró al  agregar');
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
procedure crearListaOrdenada( var l_Ord:lista; l:lista);
begin
while (l<> nil) do begin
      agregarOrdenado(l_Ord,l^.dato);
      l:=l^.sig;
end

end;

Var

 l,p,l_Ord: lista; a,a2:arbol;

begin
 Randomize;
 l_Ord:=nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
  p:=l;
  while (p<>nil) do begin
      insertarArbol(a,p^.dato);
      p:=p^.sig;
  end;
  imprimirPorNivel(a);
  writeln('creo lista');
  crearListaOrdenada(l_Ord,l);
  imprimirLista(l_Ord);
   p:=l_Ord;
   while (p<>nil) do begin
     insertarArbol(a2,p^.dato);
     p:=p^.sig;
   end;
   imprimirPorNivel(a2);

 readln;
end.

