program ejercicioColaborativo1;
type
  ventas=record     {REGISTRO DE PASTAS}
    codigoP: integer;
    cant: real;
    fecha: integer;
    nCliente:integer;
   end;
  data= record
   CodP:integer;  {REGISTRO DEL ARBOL BINARIO}
   cant:real;
   end;
  lista=^nodo;
  nodo=record
   dato:integer;
   sig:lista;
  end;

  arbol=^nodoA;  {ARBOL BINARIO}
  nodoA= record
    dato: data;
    HI: arbol;
    HD: arbol;
   end;
procedure insertarArbol ( var a:arbol; v:ventas); {MODULO DE INSERTAR ABO}
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.CodP:= v.codigoP;
    nue^.dato.cant:= v.cant;
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.CodP > v.codigoP) then {SI EL CODPASTAS A INSERTAR ES MAS CHICO QUE EL NODO, SE VA A LA IZQ}
      insertarArbol(a^.HI, v)
    else
        if (a^.dato.CodP < v.codigoP) then     {SI ES MAS GRANDE A LA DERECHA}
       insertarArbol(a^.HD,v)
    else
      a^.dato.cant:= a^.dato.cant + v.cant;  {SI EL CODIGO YA EXISTE, SE SUMAN LAS CANTIDADES}
  end
end;
Procedure preOrden( a: arbol );         {IMPRIMIR DATOS ABO GENERICO COD DE PASTA Y CANT}
begin
  if ( a <> nil ) then begin
    write ('codigo de pasta: ', a^.dato.CodP, '   ');
    writeln( ' cant de pastas kg: ', a^.dato.cant:2:2, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;
procedure agregarOrdenado(var pri:lista; c:integer);
var
   nuevo, anterior, actual: lista;
begin
     new (nuevo);
     nuevo^.dato:= c;
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

procedure imprimirLista(l:lista);
begin
    if(l=nil) then
        writeln('--- fin de la lista ---')
    else begin
        writeln ('Codigo de pasta',l^.dato);
        ImprimirLista(l^.Sig);
    end;
 end;
procedure disposearLista(var l:lista);
var aux:lista;
begin
  while (l<>nil) do begin
      aux:=l;
      l:=l^.Sig;
      dispose(aux);
  end
end;
procedure disposearArbol(var a:arbol);
begin
  if (a<>nil) then begin
    disposearArbol(a^.HI);
    dispose(a);
    disposearArbol(a^.HD);
    end;
end;

procedure LeerVenta(var v:ventas);   {LECTURA DEL RECORD}
begin
  writeln ('codigo de Pasta');
  readln(v.codigoP);
  if( v.codigoP <> 0)then begin
    writeln('cantidad de pastas (kg)');
    readln(v.cant);
    writeln('fecha:');
    readln(v.fecha);
    writeln('numero de cliente');
    readln(v.nCliente);
  end;
  end;

procedure BuscarCantMin(a:arbol; var vm:data);   {BUSCO EL MINIMO, RECORRIENDO EL ABO Y ACTUALIZANDO POR REF UN REGISTRO CON RECURSION}
begin
    if( a <> nil)  then begin   {MIENTRAS ARBOL NO SEA NIL}
      BuscarCantMin(a^.HI,vm);   {BUSCO EN HIJO IZQ}
      if(a^.dato.cant < vm.cant) then begin   {SI LA CANTIDAD DE PASTAS DEL NODO ES MENOR A LA DE MI REGISTRO}
            vm:= a^.dato; {ME LLEVO EL REGISTRO}
      end;
      BuscarCantMin(a^.HD,vm); {BUSCO EN HIJO DERECHO} {SI HIJO IZQ O DER SON NIL, TERMINAN Y VUELVEN DE LA RECURSION}
   end;
end;

var a:arbol; l:lista; v:ventas; Opcion:integer; vm:data;  {OPCION variable para usar el case, vm es la venta minima del arbol}
begin
  vm.cant:= 99999;
  vm.CodP:=0;
  writeln('---- MENU DE USUARIO---- ');
  writeln('0 - terminar operacion');
  writeln('1- Insertar VENTA A Arbol');
  writeln('2- Leer Venta');
  writeln('3- Imprimir Arbol');
  writeln('4- Buscar Venta con menos Pastas vendidas');
  writeln('Escribe el numero de la Opcion a utilizar');
  readln(opcion);
  while (opcion<>0) do begin
    case opcion of          {opciones para el usuario}
    1: insertarArbol(a,v);
    2: LeerVenta(v);
    3: preOrden(a);
    4: BuscarCantMin(a,vm);
    {falta crear lista usando arbol}
    6: imprimirLista(l);
    end;
    case opcion of           {respuestas despues de ejecutar los algoritmos, para que sea mas bonito}
    1: writeln('Insertado en el Arbol');
    2: writeln ('venta Leida');
    4: writeln('PASTA MENOS VENDIDA: Codigo:', vm.CodP, 'cantPasta', vm.cant:2:2);
    5: writeln ( 'lista creada con los codigos con mas de 10 kilos vendidos  :) ');
    6: writeln (' CODIGOS CON MAS DE 10 KILOS DE PASTA VENDIDOS :)');
    end;
    writeln ('ELIGE HACER ALGO MAS');
    readln(opcion);
  end;
  if(opcion =0) then
      disposearLista(l);
      imprimirLista(l);

  writeln('--- FIN DEL PROGRAMA----');
  readln();
    {falta informar los codigos de pasta que tuvieron mas de 10 kilos en ventas}
end.

