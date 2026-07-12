Program ParcialHECHO;
Uses
     sysutils;
Type
     str70= string[70];

	 jugador = record
        DNI: longint;
	    nombre_apellido: str70;
        equipo: str70;
	    goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;

    partido= record
		identificador: longint;
		local: str70;
		visitante: str70;
		fecha_partido: fecha;
        estadio: str70;
		goleadores: lista;
     end;

     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;

     //mis types
     partidazos=record
         fecha_partido:fecha;
         goles:integer;
     end;

     lGoles= ^nodoG;
     nodoG= record
      dato: partidazos;
      sig: lGoles;
      end;

     Rarbol=record
        dni:longint;
        nombre_apellido: str70;
        equipo: str70;
        totalGoles: integer;
        l:lGoles;
     end;
     arbol= ^nodoA;
     nodoA=record
        dato:Rarbol;
        HI:arbol;
        HD: arbol;
        end;

     nombres= array [1..20] of str70;

     {Completar con los tipos de datos necesarios}

procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(12)+1;
  if(f.mes = 2) and (f.dia > 28)then
	f.dia := 28
  else
	if((f.mes = 4) or (f.mes = 6) or (f.mes =9) or (f.mes = 11)) and (f.dia = 31)then
		f.dia := 30;
  f.anio:=2022;
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

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Atletico Tucuman';
     v[2]:='Huracan';
     v[3]:='Gimnasia LP';
     v[4]:='Godoy Cruz';
     v[5]:='Argentino Juniors';
     v[6]:='River';
     v[7]:='Boca';
     v[8]:='Racing';
     v[9]:='Platense';
     v[10]:='San Lorenzo';
     v[11]:='Patronato';
     v[12]:='Estudiantes';
     v[13]:='Union';
     v[14]:='Newells';
     v[15]:='Barracas';
     v[16]:='Tigre';
     v[17]:='Arsenal';
     v[18]:='Sarmiento';
     v[19]:='Central';
     v[20]:='Colon';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(2);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Colon')or(visitante='Colon'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   equipo:='Colon';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            equipo:=local
          else
            equipo:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(20)+1;
     v[1]:= 'Antonio Vespucio Liberti';
     v[2]:= 'Mario Alberto Kempes';
     v[3]:= 'Alberto Armando';
     v[4]:= 'Ciudad de La Plata';
     v[5]:= 'Presidente Peron';
     v[6]:= 'Jose Amalfitani';
     v[7]:= 'Tomas Adolfo Duco';
     v[8]:= 'Libertadores de America';
     v[9]:= 'Pedro Bidegain';
     v[10]:= 'Nestor Diaz Perez';
     v[11]:= 'Marcelo Bielsa';
     v[12]:= 'Gigante de Arroyito';
     v[13]:= 'Malvinas Argentinas';
     v[14]:= 'Brigadier General Estanislao Lopez';
     v[15]:= 'Eduardo Gallardon';
     v[16]:= 'Jose Maria Minella';
     v[17]:= 'Florencio Sola';
     v[18]:= 'Monumental Jose Fierro';
     v[19]:= 'Nueva España';
     v[20]:= 'Nuevo Francisco Urbano';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               identificador:= random (100000)+1;
               pos:= random(20)+1;
               estadio:= v[pos];
               loc:= random(20)+1;
               local:=v2[loc];
               vis:= random(20)+1;
               visitante:=v2[vis];
               while(local=visitante)do
               begin
                   vis:= random(20)+1;
                   visitante:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, local, visitante);
          end;
          agregar(l, p);
       end;
end;


procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ', goles);
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
          writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
 // aca empiezo//
procedure agregarPartidos(var l:lGoles; f:fecha; g:integer);
var nue:lGoles;
   begin
       new(nue);
       nue^.dato.fecha_partido:= f;
       nue^.dato.goles:=g;
       nue^.sig:= l;
       l:= nue;
   end;

procedure insertarArbol ( var a:arbol; p:partido; j:jugador);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.dni:=j.dni;
    nue^.dato.nombre_apellido:= j.nombre_apellido;
    nue^.dato.equipo:= j.equipo;
    nue^.dato.l:= nil;
    nue^.dato.totalGoles:= j.goles;
    agregarPartidos(nue^.dato.l, p.fecha_partido, j.goles);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.dni > j.dni) then
      insertarArbol(a^.HI, p,j)
    else
        if (a^.dato.dni < j.dni) then
       insertarArbol(a^.HD,p,j)
    else begin
         a^.dato.totalGoles:= a^.dato.totalGoles + j.goles; // totalizo los goles para ahorrarme tener que contarlos despues con recursion.
         agregarPartidos(a^.dato.l, p.fecha_partido, j.goles);
    end;
  end;
end;

procedure listaAArbol (var a: arbol; l:listaPartidos);
var l2:lista;
  begin
   while( l <> nil) do begin
       l2:= l^.dato.goleadores;
       while( l2 <> nil) do begin
           insertarArbol(a,l^.dato, l2^.dato);
           l2:= l2^.sig;
       end;
       l:=l^.sig;
   end;
  end;
Procedure elMayor( a: arbol; var max:integer; var MaxE: str70 ); {MENOR A MAYOR}
begin
  if ( a <> nil ) then begin
    elMayor (a^.HI,max,MaxE);
    if( a^.dato.totalGoles > max) then begin
        max:= a^.dato.totalGoles;
        MaxE:= a^.dato.equipo;
    end;
    elMayor (a^.HD,max,MaxE)
  end;
end;
procedure verValoresRango(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.dni >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.dni <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.HI, inf, sup);            {en orden de los datos}
        writeln('              DNI:', a^.dato.dni);
        writeln( '             nombre y apellido: ', a^.dato.nombre_apellido);
        verValoresRango(a^.HD, inf, sup);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.HI, inf, sup) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.HD, inf, sup);   {me fijo en los de la derecha}
end;
// imprimir arbol y datos //
procedure imprimirListaG(l:lGoles);
begin
  while (l<> nil) do begin
      writeln( '   Fecha de Partido:  ', l^.dato.fecha_partido.dia, '',l^.dato.fecha_partido.mes, '', l^.dato.fecha_partido.anio);
      writeln( '   goles:   ', l^.dato.goles);
      l:= l^.sig;
  end;
end;

Procedure enOrden( a: arbol ); {MENOR A MAYOR}
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    writeln ('DNI:   ', a^.dato.dni);
    writeln( 'Nombre y Apellido:   ', a^.dato.nombre_apellido);
    writeln(' equipo:  ', a^.dato.equipo);
    writeln( ' numero de goles :   ', a^.dato.totalGoles);
    imprimirListaG(a^.dato.l);
    enOrden (a^.HD)
  end;
end;
procedure disposearLista(var l:lGoles);
 var aux:lGoles;
    begin
         aux:= l;
         while (aux <> nil) do begin
             l:= l^.sig;
             dispose(aux);
             aux:= l;
         end;
    end;
function darMin(a:arbol):Rarbol;
begin
     if (a= nil) then begin {SI EL ARBOL ES VACIO}
         darMin:= a^.dato;
     end
     else begin
       if(a^.HI = nil) then begin
        darMin:= a^.dato; { si no hay más hijos izq, este es el minimo}
       end
       else begin
        darMin:= darMin(a^.HI); {si hay hijos izq ,busquemos el minimo de ellos}
        end;
end;
end;
procedure borrarElemento ( var a:arbol; lean:longint;  var resultado:boolean);
var aux:arbol; l:lGoles;
begin
  if( a = nil) then begin     {si está vacio, damos falso}
      resultado:= false
   end
  else begin  {sino}
      if ( a^.dato.dni > lean ) then  begin   {si el dato de mi nodo es mas grande}
          borrarElemento (a^.HI, lean, resultado)   {busco el elemento en los chiquitos}
      end
      else
           if (a^.dato.dni < lean) then begin    {si el dato del nodo es mas chico}
           borrarElemento (a^.HD, lean, resultado)  {busco en los mas grandes}
           end
           else begin  {sino, lo encontró!!!}
             resultado:= true;     {está}
             if(a^.HI = nil)then begin    {si no tiene hijo izq /o ninguno de los dos}
             aux:= a;		{aux es a, a apunta al hijo derecho}
             a:= a^.HD;
             disposearLista(aux^.dato.l); // borro la lista
             dispose(aux)            {lo borra}
             end
             else
                if (a^.HD = nil) then begin {sino si no tiene hijo der}
                 aux:= a;	{aux es a, a apunto al hijo izq}
                 a:= a^.HI;
                 disposearLista(aux^.dato.l); // borro la lista
                 dispose(aux)   {lo borra}
                 end
                 else begin    {SI EXISTEN LOS DOS NODOS}
                   a^.dato:= darMin(a^.HD);  {me copio el dato mas chico, porque va a ser el mas cercano al dato a borrar y mantendrá la linealidad de la estructura}
                   borrarElemento(a^.HD, a^.dato.dni ,resultado); { y ahora busco borrar ese nodo minimo}
                 end;
           end;
         end;
end;


var
   l: listaPartidos;  a:arbol; max:integer; MaxE:str70;  b:boolean;
begin
     Randomize;

     l:= nil;
     a:=nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);
     listaAArbol(a,l); // punto A
     max:= -1;
     WRITELN();
     elMayor(a,max,MaxE);
     writeln ( 'El Goleador Más Grande es del equipo:   ', MaxE);
     writeln( 'valores ACOTADOS:   ');
     verValoresRango(a,28000000,32000000);
     b:= false;
     writeln ( '----- fin de valores----');
     writeln ( '-----Arbol binario----');
     enOrden(a);
     writeln ( '-----fin del arbol ----');
     borrarElemento(a,34807474,b);
     if( b) then
         writeln (' borramos al profe por desaprobarme >:) ')
     else
         writeln (' no borramos al profe, se escapó >:(');
     writeln ( '-----Arbol binario MODIFICADO ----');
     enOrden(a);
     writeln ( '-----FIN DEL ARBOL----');

     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.
