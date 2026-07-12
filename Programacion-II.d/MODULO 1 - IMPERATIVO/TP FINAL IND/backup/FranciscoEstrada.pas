program FranciscoEstrada;
type
  str20=string[30];
  fecha=record
    dia:integer;
    mes: str20;
    anio:integer;
  end;
  duenio=record
    dni:longint;
    nom_apellido:str20;
    dire:str20;
  end;

  mascota=record
    id:integer;
    tipo:str20;
    peso:real;
    fIngreso:fecha;
    cantIntervenciones: integer;
    d:duenio;
    end;
  lmascota=record
     id:integer;
    tipo:str20;
    peso:real;
    fIngreso:fecha;
    cantIntervenciones: integer;
  end;

  lista=^nodo;
  nodo=record
     dato:lmascota;
     sig:lista;
  end;

 Rarbol=record
   dni:longint;
   nom_apellido:str20;
   dire:str20;
   l: lista;
 end;
 arbol=^nodoA;
 nodoA=record
   dato:Rarbol;
   HI:arbol;
   HD:arbol;
 end;
procedure LeerFecha( var f:fecha);
begin
  writeln('dia (numero): ');
  readln(f.dia);
  writeln('mes (ej: marzo): ');
  readln(f.mes);
  writeln('año (numero):  ');
  readln(f.anio);
end;

procedure LeerDuenio(var d:duenio);
 begin
    with (d) do begin
    writeln('dni del dueño: ');
    readln(dni);
    writeln('nombre y apellido del dueño: ');
    readln(nom_apellido);
    writeln('direccion del dueño: ');
    readln(dire);
 end;
end;
procedure LeerMascota(var m:mascota);
begin
  writeln('datos del dueño:  ');
  LeerDuenio(m.d);
  if( m.d.dni <> 90909090) then begin
    with (m) do begin
         writeln('id de mascota : ');
         readln(m.id);
         writeln('tipo de mascota (perro,gato,etc) :  ');
         readln(m.tipo);
         writeln('peso de mascota : ');
         readln(m.peso);
         writeln('fecha de ingreso : ');
         LeerFecha(m.fIngreso);
         writeln('cantidad de intervenciones : ');
         readln(m.cantIntervenciones);
    end;
   end;
end;
Procedure agregarDato(var l: lista; m:mascota);
var
   aux:lista;
begin
     new(aux);
     aux^.dato.id := m.id;
     aux^.dato.tipo:=m.tipo;
     aux^.dato.peso:=m.peso;
     aux^.dato.fIngreso:=m.fIngreso;
     aux^.dato.cantIntervenciones:=m.cantIntervenciones;
     aux^.sig := l;
     l:= aux;
end;
procedure insertarArbol ( var a:arbol; m:mascota; d:duenio); {MODULO DE INSERTAR ABO}
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.dni:= d.dni;
    nue^.dato.nom_apellido:=d.nom_apellido;
    nue^.dato.dire:=d.dire;
    nue^.dato.l:=nil;
    agregarDato(nue^.dato.l,m);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.dni > d.dni) then {SI  codp del arbol es más grande}
      insertarArbol(a^.HI, m,d)
    else
        if (a^.dato.dni < d.dni) then     {SI  codp del arbol ES MAS chico A LA DERECHA}
       insertarArbol(a^.HD,m,d)
    else
      agregarDato(a^.dato.l,m);
  end
end;
function recorridoDeMascotas(l:lista):integer;
var total:integer;
begin
total:=0;
 while (l<> nil) do begin
     total:= total + l^.dato.cantIntervenciones;
     l:=l^.sig;
 end;
 recorridoDeMascotas:= total;
end;

Procedure menorIntervenciones( a: arbol; var min:integer; var domicilio:str20); // punto B
var tot:integer;
begin
  tot:=0;
  if ( a <> nil ) then begin
    menorIntervenciones(a^.HI,min,domicilio);
      tot:=recorridoDeMascotas(a^.dato.l);   // pude haber hecho un campo más al registro del arbol que totalice la cantidad de intervenciones pero me pareció poco verosimil.
      if(tot < min) then begin
         min:= tot;
         domicilio:= a^.dato.dire;
      end;
    menorIntervenciones(a^.HD,min,domicilio)
  end;
end;
procedure verValoresRango(a: arbol; inf:integer; sup:integer); // punto C
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.dni >= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.dni <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.HD, inf, sup);            {en orden de los datos}
        writeln(' datos de Dueño:  ');
        writeln( '      dni:  ', a^.dato.dni);
        writeln('        nombre y apellido:   ', a^.dato.nom_apellido);
        writeln('        dirección:  ', a^.dato.dire);
        verValoresRango(a^.HI, inf, sup);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.HI, inf, sup) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.HD, inf, sup);   {me fijo en los de la derecha}
end;
function verificarFecha(f:fecha):boolean;
var resultado:boolean;
begin
 resultado:=false;
 if( f.anio = 2023) then begin
   if( f.mes= 'enero') or (f.mes = 'febrero') or (f.mes= 'marzo') then
       resultado:= true;
 end;
 verificarFecha:= resultado;
end;
function masde10Kg( l:lista):lista;
var   dato: lista;
begin
 dato:= nil;
 while( l<> nil) and (dato = nil) do begin
     if( l^.dato.peso > 10) and (verificarFecha(l^.dato.fIngreso)) then
        dato:= l
     else
         l:=l^.sig;
 end;
 masde10Kg:= dato;
end;

Procedure enOrden( a: arbol ); {MENOR A MAYOR}  // punto d
var mascotaGorda:lista;
begin

  if ( a <> nil ) then begin
    enOrden (a^.HI);
    mascotaGorda:= masde10Kg(a^.dato.l);
    if ( mascotaGorda <> nil ) then begin
      writeln('datos del Dueño:  ');
      writeln ('     dni:   ', a^.dato.dni);
      writeln( '     nombre y apellido:  ', a^.dato.nom_apellido);
      writeln ( 'datos de la mascota que pesa mas de 10 kg:  ');
      writeln(' id:  ',mascotaGorda^.dato.id);
      writeln('tipo de animal: ',mascotaGorda^.dato.tipo);
    end;
    enOrden (a^.HD)
  end;
end;

var m:mascota;  a:arbol; min:integer; domicilio:str20;
begin
  a:=nil;
  LeerMascota(m);
  while (m.d.dni<>90909090) do begin
        insertarArbol(a,m,m.d);
        LeerMascota(m);
  end;
  min:= 99999;
  menorIntervenciones(a,min,domicilio);
  writeln(' domicilio de la persona con menos intervenciones:  ', domicilio);
  verValoresRango(a,15000000,30000000);
  enOrden(a);
  writeln('---FIN DEL PROGRAMA---');
  readln();
end.

