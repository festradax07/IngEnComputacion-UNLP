Program ArboldeListas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;
 lista2= ^nodo2;
 nodo2=record
   codigo: integer;
   sig:lista2;
 end;
 Rarbol= record
   peso:integer;
   l:lista2;
 end;
 arbol=^nodoA;
 nodoA=record
   dato:Rarbol;
   HI:arbol;
   HD:arbol;
 end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;
procedure AgregarAdelante2(var l: Lista2; c: integer);
var
  aux: lista2;
begin
  new(aux);
  aux^.codigo := c;
  aux^.sig := l;
  l:= aux;
end;
procedure insertarArbol ( var a:arbol; e:encomienda); {MODULO DE INSERTAR ABO}
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.peso:= e.peso;
    nue^.dato.l:=nil;
    AgregarAdelante2(nue^.dato.l,e.codigo);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.peso > e.peso) then {SI EL CODPASTAS A INSERTAR ES MAS CHICO QUE EL NODO, SE VA A LA IZQ}
      insertarArbol(a^.HI, e)
    else
        if (a^.dato.peso < e.peso) then     {SI ES MAS GRANDE A LA DERECHA}
       insertarArbol(a^.HD,e)
    else
      AgregarAdelante2(a^.dato.l,e.codigo);  {SI EL CODIGO YA EXISTE, SE SUMAN LAS CANTIDADES}
  end
end;
procedure recorrerLista(var a:arbol; l:lista);
begin
 while (l<>nil) do begin
   insertarArbol(a,l^.dato);
   l:=l^.sig;
   end;
end;
procedure imprimirL(l:lista2);
begin
 while (l<>nil) do begin
   writeln('     CODIGO: ', l^.codigo);
   l:= l^.sig;
   end;
 end;
procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('PESO: ', a^.dato.peso);
    imprimirL(a^.dato.l);
    EnOrden(a^.HD);
  end;
 end;


Var

 l: lista;   a:arbol;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 writeln ('ARBOL DE LISTAS');
 recorrerLista(a,l);
 EnOrden(a);

 readln;
end.
