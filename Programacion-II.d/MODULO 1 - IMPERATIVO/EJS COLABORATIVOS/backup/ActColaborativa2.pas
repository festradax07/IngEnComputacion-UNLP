program ActColaborativa2;
type
  str20 = string[20];
  paciente = record
    dni:integer;
    codp:integer;
    nomCiudad:str20;
  end;
  lista2=^nodo2;
  nodo2=record
    dni:integer;
    sig:lista2;
  end;

  rLista=record
    nomCiudad: str20;
    l2:lista2;
  end;

  llista= ^nodo;
  nodo = record
    dato:rLista;
    sig:llista;
  end;

  Rarbol=record
    codp:integer;
    l: llista;
  end;
  arbol=^nodoA;
  nodoA= record
    dato:Rarbol;
    HI:arbol;
    HD:arbol;
  end;
{-----------------------------------------------------------------}
procedure leerPaciente( var p:paciente);
begin
  writeln('dni: ');
  readln(p.dni);
  if(p.dni <> 0) then begin
    writeln('codp:');
    readln(p.codp);
    writeln('nomCiudad: ');
    readln(p.nomCiudad);
  end;
end;

procedure AgregarDato2(var l2:lista2; d:integer);
var nue:lista2;
begin
    new(nue);
    nue^.dni:=d;
    nue^.sig:= l2;
    l2:= nue;
end;
procedure AgregarDato1( var l:llista; n:str20; d:integer);
var nue:llista;
begin
    new(nue);
    nue^.dato.nomCiudad:=n;
    nue^.dato.l2:=nil;
    nue^.sig:=l;
    l:= nue;
    AgregarDato2(l^.dato.l2,d);

  end;
procedure checkCiudades( var l:llista; p:paciente);
begin
 if( l <> nil) then begin
        if(l^.dato.nomCiudad = p.nomCiudad) then begin
          AgregarDato2(l^.dato.l2,p.dni)
        end
        else
            checkCiudades(l^.sig,p)
 end;
 if(l = nil) then begin
  AgregarDato1(l,p.nomCiudad,p.dni);
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
    if( a^.dato.codp > p.codp) then {SI EL CODPASTAS A INSERTAR ES MAS CHICO QUE EL NODO, SE VA A LA IZQ}
      insertarArbol(a^.HI, p)
    else
        if (a^.dato.codp < p.codp) then     {SI ES MAS GRANDE A LA DERECHA}
       insertarArbol(a^.HD,p)
    else
      checkCiudades(a^.dato.l, p);  {SI EL CODIGO YA EXISTE, SE SUMAN LAS CANTIDADES}
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
 end;

var
 a:arbol; p:paciente;
begin
  leerPaciente(p);
  while(p.dni<>0) do begin
    insertarArbol(a,p);
    leerPaciente(p);
  end;
  EnOrden(a);
  readln;

end.

