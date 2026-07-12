program ActividaColaborativa2Final;
Const
  MaxPostal=1900;
  MinPostal=1800;
type
  str20 = string[20];
  paciente = record    {registro de pacientes}
    dni:integer;
    codp:integer;
    nomCiudad:str20;
  end;
  lista2=^nodo2;   {lista de dnis}
  nodo2=record
    dni:integer;
    sig:lista2;
  end;

  rLista=record
    nomCiudad: str20;         {record de lista de listas}
    l2:lista2;
  end;

  llista= ^nodo;     {lista de lista}
  nodo = record
    dato:rLista;
    sig:llista;
  end;

  Rarbol=record    {reg del arbol}
    codp:integer;
    l: llista;
  end;
  arbol=^nodoA;     {arbol binario}
  nodoA= record
    dato:Rarbol;
    HI:arbol;
    HD:arbol;
  end;
//Tipos para Ejercico 1//

Desc= record
    CPostal:integer;
    City:str20;
    Infectados:integer;
end;

MapaCiudad= ^nodoC;
nodoC= record
     dato:Desc;
     Hi:MapaCiudad;
     Hd:MapaCiudad;
     end;

{-----------------------------------------------------------------}
procedure leerPaciente( var p:paciente); {lectura del paciente}
begin
  writeln(' ');
 writeln('Si sesea salir inserte DNI 0');
  writeln('Dni: ');
  readln(p.dni);
  if(p.dni <> 0) then begin
    writeln('Codp:');
    readln(p.codp);
    writeln('NomCiudad: ');
    readln(p.nomCiudad);
  end;
end;

procedure AgregarDato2(var l2:lista2; d:integer);  {agrego dni a la lista}
var nue:lista2;
begin
    new(nue);
    nue^.dni:=d;
    nue^.sig:= l2;
    l2:= nue;
end;
procedure AgregarDato1( var l:llista; n:str20; d:integer); {agrego ciudad (nodo de la lista de lista)}
var nue:llista;
begin
    new(nue);
    nue^.dato.nomCiudad:=n;
    nue^.dato.l2:=nil;
    nue^.sig:=l;
    l:= nue;
    AgregarDato2(l^.dato.l2,d);

  end;
procedure checkCiudades( var l:llista; p:paciente); {comprueba si la ciudad ya está en la lista de listas o no }
begin
 if( l <> nil) then begin
        if(l^.dato.nomCiudad = p.nomCiudad) then begin   {si el nombre de la ciudad es el mismo que el nodo}
          AgregarDato2(l^.dato.l2,p.dni)     {agrego dni}
        end
        else
            checkCiudades(l^.sig,p)   {sino paso al siguiente nodo y compruebo con recursion}
 end;
 if(l = nil) then begin
  AgregarDato1(l,p.nomCiudad,p.dni);  {si la recorrí y no apareció la ciudad, la agrego}
end;
end;


procedure insertarArbol ( var a:arbol; p:paciente); {MODULO DE INSERTAR ABO}
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.codp:= p.codp;
    nue^.dato.l:=nil;
    AgregarDato1(nue^.dato.l,p.nomCiudad, p.dni);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.codp > p.codp) then {SI  codp del arbol es más grande}
      insertarArbol(a^.HI, p)
    else
        if (a^.dato.codp < p.codp) then     {SI  codp del arbol ES MAS chico A LA DERECHA}
       insertarArbol(a^.HD,p)
    else
      checkCiudades(a^.dato.l, p);  {SI EL CODIGOP YA EXISTE, comprueba la lista de lista, buscando la ciudad}
  end
end;
procedure imprimirL2(l2:lista2);
begin
 while (l2<>nil) do begin
   writeln('     dni: ', l2^.dni);
   l2:= l2^.sig;
   end;
 end;
procedure imprimirL(l:llista);
begin
 while (l<>nil) do begin
   writeln('   Ciudad: ', l^.dato.nomCiudad);
   imprimirl2(l^.dato.l2);
   l:= l^.sig;
   end;
 end;
procedure EnOrden(a:arbol);
begin
 if(a<>nil) then begin
    EnOrden(a^.HI);
    writeln('CODIGO :', a^.dato.codp);
    imprimirL(a^.dato.l);
    EnOrden(a^.HD);
  end;
 end;                  {de arriba para abajo imprime todos los datos en orden: arbol- lista de listas - lista 2}
procedure contarDnis(l:lista2; var tot:integer);
begin
     while(l<>nil) do begin
       tot:= tot + 1;
       l:=l^.sig ;
     end;
end;
procedure contabilizar(l:llista; var tot:integer);
begin
   if(l= nil) then begin
     tot:= tot + 0;
   end
   else begin
     contarDnis(l^.dato.l2, tot);
     contabilizar(l^.sig, tot);
end;
end;
procedure verValoresRango(a: arbol; inf:integer; sup:integer);
var tot:integer;
begin
 tot:=0;
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.codp >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.codp <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.hi, inf, sup);            {en orden de los datos}
        writeln(a^.dato.codp);
        Contabilizar(a^.dato.l,tot);
        writeln('                   total de dnis por codigo postal:  ',tot);
        verValoresRango(a^.hd, inf, sup);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.hi, inf, sup) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.hd, inf, sup);   {me fijo en los de la derecha}
end;
//modulos del Ejercicio 1//

{Modulo insertar}
procedure InsertarEj1 ( var b:MapaCiudad; p:paciente);
var nue:MapaCiudad;
begin
  if( b = nil)then begin
    new(nue);
    nue^.dato.CPostal:= p.codp;
    nue^.dato.City:=p.nomCiudad;
    nue^.dato.Infectados:= 1;
    nue^.Hd:= nil;
    nue^.Hi:= nil;
    b:= nue;
  end
  else begin
    if( b^.dato.CPostal > p.codp) then {SI  codp del arbol es más grande}
      InsertarEj1(b^.Hi, p)
    else
        if (b^.dato.CPostal < p.codp) then     {SI  codp del arbol ES MAS chico A LA DERECHA}
       InsertarEj1(b^.Hd,p)
    else
      b^.dato.Infectados:=b^.dato.Infectados+1;  {SI EL CODIGOP YA EXISTE, suma 1 al total}
  end
end;

{Modulo para mostrar la info cargada}
procedure ImprimirEnOrden(b:MapaCiudad);
begin
 if(b<>nil) then begin
    ImprimirEnOrden(b^.Hi);
    writeln('CODIGO :', b^.dato.CPostal);
    writeln(          'La ciudad:', b^.dato.City);
    writeln(          'Total de infectados:', b^.dato.Infectados);
    ImprimirEnOrden(b^.Hd);
  end;
 end;

{Modulo Inciso B}
procedure InfxPostal(b:MapaCiudad);
begin
  if (b<> nil) then
    if (b^.dato.CPostal >= MinPostal) then
      if (b^.dato.CPostal <= MaxPostal) then begin
        InfxPostal(b^.Hi);
        writeln('CODIGO:',b^.dato.CPostal,'Infectados:',b^.dato.Infectados);
        InfxPostal(b^.Hd);
      end
      else
        InfxPostal(b^.Hi)
    else
      InfxPostal(b^.Hd);
end;

var
 a:arbol; p:paciente;ARB:MapaCiudad;
begin
  leerPaciente(p);
  while(p.dni<>0) do begin
    insertarArbol(a,p);
    leerPaciente(p);
  end;
  EnOrden(a);
  writeln('contabilizar dnis: ');
  verValoresRango(a,1800,1900);
  writeln('--- FIN PARTE 2---');
  readln;

  writeln('iniciando Ejercio 1 (Totales)');
  leerPaciente(p);
  while(p.dni<>0) do begin
    InsertarEj1(ARB,p);
    leerPaciente(p);
  end;
  ImprimirEnOrden(ARB);
  readln;
  Writeln('Busqueda');
  InfxPostal(ARB);
  readln;
end.
