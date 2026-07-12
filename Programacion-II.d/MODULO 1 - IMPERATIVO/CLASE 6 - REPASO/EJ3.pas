Program EJ3;
Uses
     sysutils;
Type
     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: integer;
	      codArea: integer;
          domicilio: string;
          tel: string;
     end;

     listaPedidos = ^nodoLista;
     nodoLista = record
               dato: pedido;
               sig: listaPedidos;
     end;
     ldni=^nodod;
     nodod=record
      dni:integer;
      sig:ldni;
     end;

     Rarbol=record
      codArea:integer;
      totalP:integer;
      l:ldni;
     end;
     arbol=^nodoA;
     nodoA=record
      dato:Rarbol;
      HI: arbol;
      HD:arbol;
     end;

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
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
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
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


function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.codArea := (random(4000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;
 procedure agregarDni(var l:ldni;d:integer);
 var  nue:ldni;
    begin
      new(nue);
      nue^.dni:=d;
      nue^.sig:=l;
      l:=nue;
    end;

procedure insertarArbol ( var a:arbol; dato:Pedido);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.codArea:= dato.codArea;
    nue^.dato.totalP:= 1;
    nue^.dato.l:=nil;
    agregarDni(nue^.dato.l,dato.dni);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.codArea > dato.codArea) then
      insertarArbol(a^.HI, dato)
    else
        if (a^.dato.codArea < dato.codArea) then
       insertarArbol(a^.HD,dato)
    else  begin
       a^.dato.totalP:=a^.dato.totalP+1;
       agregarDni(nue^.dato.l,dato.dni);
    end;
  end;

end;

procedure recorrerInsertar(var a:arbol; l:listaPedidos);
begin
  while( l<> nil) do begin
      insertarArbol(a,l^.dato);
      l:=l^.sig;
  end;
end;
procedure EnOrden(a:arbol;var min:integer);
begin
 if(a<>nil) then begin
   EnOrden(a^.HI,min);
   if( a^.dato.totalP < min) then
     min:= a^.dato.totalP;
   EnOrden(a^.HD,min);
 end;
end;

procedure imprimirL(l:ldni);
begin
 while(l<>nil) do begin
     writeln('    dni:  ',l^.dni);
     l:=l^.sig;
 end;
end;

procedure verValoresRango(a: arbol; inf:integer; sup:integer);  {30millon y 40millon}
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.codArea >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.codArea <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.HI, inf, sup);            {en orden de los datos}
        writeln('codigo de area:  ', a^.dato.codArea);
        imprimirL(a^.dato.l);
        verValoresRango(a^.HD, inf, sup);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.HI, inf, sup) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.HD, inf, sup);   {me fijo en los de la derecha}
end;

procedure BusquedaCodArea(a: arbol; cod:integer);
begin
  if(a <> nil)then
  begin
    if(a^.dato.codArea = cod)then begin
       writeln('codArea: ', cod, ' encontrado : ');
       imprimirL(a^.dato.l);
    end
    else
       if(a^.dato.codArea > cod)then
          BusquedaCodArea(a^.hi, cod)
       else
          BusquedaCodArea(a^.hd, cod);
  end
  else
  begin
    writeln('no existe en el arbol');
  end;
end;

var
   l_inicial: listaPedidos;   a:arbol; min:integer; cod:integer;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     crearLista(l_inicial);
     writeln ('Lista: ');
     imprimirLista(l_inicial);
     recorrerInsertar(a,l_inicial);
     min:= 9999;
     EnOrden(a,min);
     writeln( 'con function:  ', Mini(a));
     verValoresRango(a,1000,2000);
     writeln( ' inserte codigo de area a buscar:  ');
     readln(cod);
     BusquedaCodArea(a,cod);
     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.

