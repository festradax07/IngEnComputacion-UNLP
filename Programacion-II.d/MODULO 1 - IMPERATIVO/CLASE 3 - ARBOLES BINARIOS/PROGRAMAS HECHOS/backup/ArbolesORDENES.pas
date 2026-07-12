Program ArbolesORDENES;
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
procedure listaArbol(var a: arbol; l:lista);
begin
 while (l<>nil) do begin
   insertarArbol(a,l^.dato);
   l:=l^.sig;
 end;

end;

Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    write (a^.dato, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;
Procedure enOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato, '   ');
    enOrden (a^.HD)
  end;
end;
procedure postOrden(a:arbol);
begin
 if(a<>nil) then begin
   postOrden(a^.HI);
   postOrden(a^.HD);
   write(a^.dato, ' ');
 end;
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
Function Buscar(a:arbol; x:integer):arbol;
var medio:integer;
begin
    if( a= nil)  then begin
        buscar:= nil
    end
    else begin
     if(a^.dato = x) then begin
        buscar:= a;
    end
    else
      if(a^.dato > x ) then begin
            buscar:= buscar(a^.HI, x);
      end
      else begin
         buscar:= buscar(a^.HD, x);

       end;
   end;
end;
function verMin(a:arbol):integer;
begin
     if (a= nil) then begin
         verMin:= -1;
     end
     else begin
       if(a^.HI = nil) then begin
        verMin:= a^.dato;
       end
       else begin
        verMin:= verMin(a^.HI);
        end;
end;

end;
function verMax(a:arbol):integer;
begin
     if (a= nil) then begin
         verMin:= -1;
     end
     else begin
       if(a^.HD = nil) then begin
        verMax:= a^.dato;
       end
       else begin
        verMax:= verMax(a^.HD);
        end;
end;

end;

Var

 l: lista; a,p:arbol; x:integer;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 listaArbol(a,l);
 writeln('Arbol PRE ORDEN:');
 imprimirpornivel(a);
 writeln('busca un dato en el arbol:');
 readln(x);
 p:=Buscar(a,x);
 if(p =nil) then
     writeln('el dato no existe en el arbol')
 else
     writeln( ' el dato EXISTE en el arbol');
 x:= verMin(a);
 writeln('minimo: ',x);
 x:= verMax(a);
 writeln('maximo: ',x);
 readln;
end.

