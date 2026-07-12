program ejVuelos;
const inf=40000000;sup=50000000;
type
pasaje= record
         codVuelo:string;
         millas:real;
         dni:integer;
         nomApellido:string;
         clase:string;
end;
lista=^nodo;
nodo=record
dato: pasaje;
sig: lista;
end;

 rvuelo=record
 codVuelo:string;
  total:real;
 end;

lVuelos=^nodoV;
nodoV=record
   dato:rVuelo;
   sig:lVuelos;
  end;

cliente=record
dni:integer;
nomApellido:String;
puntajes:lVuelos;
end;

arbol=^nodoA;
nodoA=record
dato:cliente;
HI:arbol;
HD:arbol;
end;
procedure leerPasaje(var p:pasaje);
begin
  writeln('dni: ');
  readln(p.dni);
  if(p.dni<>0) then begin
    writeln('nombre y apellido:  ');
    readln(p.nomApellido);
    writeln(' clase: (ejecutiva o turista)');
    readln(p.clase);
    writeln( 'codigo de vuelo');
    readln(p.codVuelo);
    writeln( 'millas recorridas:');
    readln(p.millas);
  end;
end;
procedure agregarOrdenado(var pri:lista; p:pasaje);
var
   nuevo, anterior, actual: lista;
begin
     new (nuevo);
     nuevo^.dato:= p;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.codVuelo < nuevo^.dato .codVuelo) do begin
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
procedure AgregarDatos( var l:lVuelos; p:pasaje);
var nue:lVuelos;
begin
     new(nue);
     nue^.dato.codVuelo:=p.codVuelo;
     if( p.clase = 'ejecutiva' )then begin
         nue^.dato.total:= 100*p.millas;
     end
     else begin
         nue^.dato.total:= 25*p.millas;
     end;
     nue^.sig:=l;
     l:=nue;
end;

procedure insertarArbol ( var a:arbol; l:lista);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.dni:=l^.dato.dni;
    nue^.dato.nomApellido:=l^.dato.nomApellido;
    nue^.dato.puntajes:=nil;
    AgregarDatos(nue^.dato.puntajes,l^.dato);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.dni > l^.dato.dni) then
      insertarArbol(a^.HI, l)
    else
        if (a^.dato.dni < l^.dato.dni) then
       insertarArbol(a^.HD,l)
    else
        agregarDatos(a^.dato.puntajes,l^.dato);
end;
end;

function darMax(l:lVuelos):real;
var tot:reaL;
begin
  tot:=-1;
     while (l<>nil) do begin
         if(l^.dato.total > tot)then
           tot:= l^.dato.total;
         l:=l^.sig;
      end;
     darMax:= tot;
end;
procedure verValoresRango(a: arbol);
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.dni >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.dni <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.HI);            {en orden de los datos}
        writeln( 'mayor puntaje de pasajero con dni', a^.dato.dni , ' es:  ', (darMax(a^.dato.puntajes)):2:2);
        verValoresRango(a^.HD);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.HI) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.HD);   {me fijo en los de la derecha}
end;

function Suma(l:lVuelos ):real;
begin
     if( l= nil) then begin
         Suma:=0
     end
     else begin
        Suma:= (l^.dato.total +(Suma(l^.sig)));
     end;
end;
procedure verdatos(p:pasaje);
begin
     writeln('codigo de vuelo  ', p.codvuelo);
     writeln('dni  ', p.dni);
     writeln('nombre y apellido', p.nomApellido);
     writeln('clase: ', p.clase);
     writeln('millas:  ', p.millas);
end;

procedure imprimirLista(l:lista);
begin
     while (l<> nil) do begin
         verdatos(l^.dato);
         l:=l^.sig;
     end;
end;

Procedure enOrden( a: arbol; var max: real ); {MENOR A MAYOR}
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI,max);
     if( max < suma(a^.dato.puntajes)) then begin
       max:= suma(a^.dato.puntajes);
    end;
    enOrden (a^.HD,max)
end;
end;
var a:arbol; l:lista; p:pasaje;  max:real;
begin
  l:=nil;
  LeerPasaje(p);
  while( p.dni<> 0) do begin
      agregarOrdenado(l,p);
      LeerPasaje(p);
  end;
  imprimirLista(l);
  insertarArbol(a,l);
  max:=-1;
  enOrden(a,max);
  writeln(' puntaje maximo:  ', max:2:2);
  writeln(' ver valores entre ', inf, ' y ', sup);
  verValoresRango(a,inf,sup);
  writeln( '---');
  readln;
end.
