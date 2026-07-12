Program hecho;
Uses
	sysutils;
Type
	sub = 1..4;

	disciplina = record
		cod: integer;
		codDisciplina: integer;
		nombreDisciplina: string;
		puesto: sub;
		nombreAtleta: string;
		pais: string;
	end;

	listaDisciplinas = ^nodoLista;
	nodoLista = record
		dato: disciplina;
		sig: listaDisciplinas;
	end;
        listaP=^nodoP;
        nodoP=record
           pais:string;
           sig: listaP;
        end;

        Rarbol= record
	        codDisciplina: integer;
		nombreDisciplina: string;
		totalA: integer;
		l: listaP;
        end;
        arbol=^nodoA;
        nodoA= record
          dato:Rarbol;
          HI:arbol;
          HD:arbol;
        end;

{-----------------------------------------------------------------------------
AgregarOrdenado - Agrega ordenado en l}
Procedure agregarOrdenado(var l: listaDisciplinas; d: disciplina);
var
   nuevo, anterior, actual: listaDisciplinas;
begin
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig := nil;

	actual := l;
	anterior := l;
	while (actual<>nil) and (actual^.dato.pais < nuevo^.dato.pais) do begin
	   anterior := actual;
	   actual:= actual^.sig;
	end;
	if (anterior = actual) then
	   l := nuevo
	else
	   anterior^.sig := nuevo;
	nuevo^.sig := actual;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista }
procedure crearLista(var l: listaDisciplinas);
var
  aux: integer;
  d: disciplina;
begin
  l:= nil;
  d.cod := random (100);

  while (d.cod <> 0) do Begin
        aux:=random(193)+1;
        if(aux<10)then
            d.pais:= Concat('Pais00',IntToStr(aux))
        else
            if(aux<100)then
                d.pais:= Concat('Pais0',IntToStr(aux))
	    else
                d.pais:= Concat('Pais',IntToStr(aux));
	d.codDisciplina:= random (299)+1;
	d.nombreDisciplina:= Concat('Disciplina', IntToStr(d.codDisciplina));
	d.puesto:= random (3)+1;
	d.nombreAtleta:= Concat('Atleta', IntToStr(random(5000)));
	agregarOrdenado(l,d);
	d.cod := random (100);
  end;
end;


procedure imprimir(d:disciplina);
begin
  with (d) do begin
     writeln('codigo: ', cod);
     writeln('codDisciplina:  ', codDisciplina);
     writeln('nomDisciplina:  ', nombreDisciplina);
     writeln('puesto:  ', codDisciplina);
     writeln( ' nombre atleta: ', nombreAtleta);
     writeln('pais: ', pais);
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: listaDisciplinas);
begin
  while (l <> nil) do begin
   imprimir(l^.dato); //Completar el algoritmo para validar
   l:= l^.sig;
  end;
end;

procedure agregarPais(l:listaP; p:string);
var nue:listaP;
begin
    new(nue);
    nue^.pais:= p;
    nue^.sig:=l;
    l:= nue;
end;

procedure insertarArbol ( var a:arbol; d:disciplina);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato.codDisciplina:=d.codDisciplina;
    nue^.dato.nombreDisciplina:=d.nombreDisciplina;
    nue^.dato.totalA:= 1;
    nue^.dato.l:=nil;
    agregarPais(nue^.dato.l,d.pais);
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.codDisciplina > d.codDisciplina) then
      insertarArbol(a^.HI, d)
    else
        if (a^.dato.codDisciplina < d.codDisciplina) then
       insertarArbol(a^.HD,d)
    else
	a^.dato.totalA:= a^.dato.totalA + 1;
        agregarPais(a^.dato.l,d.pais);
    end;
end;
procedure ListaArbol(var a:arbol; l:listaDisciplinas);
begin
  while (l<>nil) do begin
   insertarArbol(a,l^.dato);
   l:=l^.sig;
  end;
end;
Procedure enOrden( a: arbol; inf:integer; sup:integer ); {MENOR A MAYOR}
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI,inf,sup);
    if(a^.dato.totalA>= inf) and (a^.dato.totalA <=sup) then
      writeln(' disciplina:  ', a^.dato.nombreDisciplina, ' tiene un total de atletas entre  ', inf , ' y ', sup);
    enOrden (a^.HD,inf,sup)
  end;
end;
procedure verValoresRango(a: arbol; inf:integer; sup:integer);
begin
  if (a <> nil) then {si a no está vacia}
    if (a^.dato.codDisciplina>= inf) then                 {si el dato es mayor o igual al min}
      if (a^.dato.codDisciplina <= sup) then begin             { y si el dato es menor o igual al sup}
        verValoresRango(a^.HI, inf, sup);            {en orden de los datos}
        writeln(' total de atletas:  ', a^.dato.totalA);
        verValoresRango(a^.HD, inf, sup);
      end
      else        {si el dato es mas grande al sup}
        verValoresRango(a^.HI, inf, sup) { me fijo los datos izquierdos}
    else         {si el dato es mas chico que el min}
      verValoresRango(a^.HD, inf, sup);   {me fijo en los de la derecha}
end;


Var

 l: listaDisciplinas;      a:arbol;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 ListaArbol(a,l);
 writeln('punto b:   ');
 writeln();
 verValoresRango(a,100,200);
 Writeln( 'punto c: ');
 writeln();
 enOrden(a,100,200);
 writeln('Fin del programa');
 readln;
end.
