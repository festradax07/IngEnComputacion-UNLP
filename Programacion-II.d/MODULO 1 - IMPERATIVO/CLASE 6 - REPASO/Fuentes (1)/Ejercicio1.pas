Program ejercicio1; 
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;
     Rpartido=record
         fecha:str10;
         puntuacion:integer;

     end;

     lPartidos=^nodoP;
     nodoP=record
      dato:Rpartido;
      sig:lPartidos;
     end;

     Rarbol=record
       dni:integer;
       nomApellido:string;
       posicion:string;
       Partidos:lPartidos;
     end;
     arbol=^nodoA;
     nodoA=record
       dato:Rarbol;
       HI:arbol;
       HD:arbol;
     end;

procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
procedure AgregarDatoP(var l:lPartidos; f:str10;p:integer);
var nue:lPartidos;
begin
  new(nue);
  nue^.dato.fecha:=f;
  nue^.dato.puntuacion:=p;
  nue^.sig:=l;
  l:=nue;
end;

procedure insertarArbol ( var a:arbol; j:jugador; p:listaPartidos); {MODULO DE INSERTAR ABO}
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.dni:= j.dni;
    nue^.dato.nomApellido:=j.nombreApellido;
    nue^.dato.posicion:= j.posicion;
    nue^.dato.Partidos:=nil;
    AgregarDatoP(nue^.dato.Partidos,p^.dato.fecha,j.puntaje);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.dni > j.dni) then {SI  codp del arbol es más grande}
      insertarArbol(a^.HI, j, p)
    else
        if (a^.dato.dni < j.dni) then     {SI  codp del arbol ES MAS chico A LA DERECHA}
       insertarArbol(a^.HD,j,p)
    else
      AgregarDatoP(a^.dato.Partidos, p^.dato.fecha,j.puntaje);  {SI EL CODIGOP YA EXISTE, comprueba la lista de lista, buscando la ciudad}
  end
end;

procedure datosL2(var a:arbol; j:lista; P:listaPartidos);
begin
  while( j<>nil) do begin
      insertarArbol(a,j^.dato, P);
      j:=j^.sig
  end
end;

procedure generarEstructura (var a:arbol; p:listaPartidos); {lista 2 es la lista grande, lista ord es la ordenada que vamos a usar}
begin
     while(p <> nil)do begin
          DatosL2(a,p^.dato.jugadores, p);
          p:=p^.sig;
end;
end;
procedure imprimirL(l:lPartidos);
var total:integer;
begin
 total:=0;
 while (l<>nil) do begin
   total:= total + l^.dato.puntuacion;
   l:= l^.sig;
   end;
 Writeln(' total de puntaje:  ', total);
 end;
Procedure enOrden( a: arbol ); {Mayor a menor}
begin
  if ( a <> nil ) then begin
    enOrden (a^.HD);
    write (a^.dato.dni, '   ');
    writeln('          ', a^.dato.nomApellido);
    writeln('          ', a^.dato.posicion);
    imprimirL(a^.dato.Partidos);
    enOrden (a^.HI)
  end;
end;

procedure sumarValoresRango(a: arbol; inf:integer; sup:integer; var suma:integer);  {30millon y 40millon}
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.dni >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.dni <= sup) then begin             { y si el dato es menor o igual al sup}
        sumarValoresRango(a^.HI, inf, sup,suma);            {en orden de los datos}
        suma:= suma + 1;
        sumarValoresRango(a^.HD, inf, sup,suma);
      end
      else        {si el dato es mas grande al sup}
        sumarValoresRango(a^.HI, inf, sup,suma) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      sumarValoresRango(a^.HD, inf, sup,suma);   {me fijo en los de la derecha}
end;
Procedure totalPosicion( a: arbol; pos:str10; var suma:integer ); {Mayor a menor}
begin
  if ( a <> nil ) then begin
    totalPosicion(a^.HI,pos,suma);
    if( a^.dato.posicion= pos) then begin
      suma:= suma + 1;
    end;
    totalPosicion(a^.HD,pos,suma);
end;
end;



var
   l: listaPartidos; a:arbol;  s:integer;  pos:str10;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);
     generarEstructura(a,l);{a}
     enOrden(a);{b}
     s:=0;
     sumarValoresRango(a,30000000,40000000,s);
     writeln('cantidad de jugadores de dni entre 30 millones y 40 millones', s);
     writeln('inserte posicion a totalizar: (arquero, defensa, mediocampo, delantero ');
     readln(pos);
     s:=0;
     totalPosicion(a,pos,s);
     writeln('existen', s ,'  ', pos, ' en el arbol');



     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.
