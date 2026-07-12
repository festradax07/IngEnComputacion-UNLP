  program biblioteca;
  type
    str70= string[70];
    libro=record
      titulo:str70;
      ISBN:integer;
      clasif:str70;
    end;
    arbol=^nodoA;
    nodoA=record
      dato: libro;
      HI:arbol;
      HD:arbol;
    end;
procedure LeerLibro(var l:libro);
begin
  with (l) do begin
    writeln('ISBN: ');
    readln(ISBN);
    if(ISBN <> 0) then
      writeln('titulo: ');
      readln(titulo);
      writeln('clasif: ');
      readln(clasif);
  end;
end;
procedure insertarArbol ( var a:arbol; l:libro);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato:=l;
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato.ISBN > l.ISBN) then
      insertarArbol(a^.HI, l)
    else
        if (a^.dato.ISBN < l.ISBN) then
       insertarArbol(a^.HD,l);
    end
end;
Function buscar(a:arbol; x:integer):boolean;
begin
    if( a= nil)  then begin
        buscar:= false;
    end
    else begin
     if(a^.dato.ISBN = x) then begin
        buscar:= true;
    end
    else
      if(a^.dato.ISBN > x ) then begin
            buscar:= buscar(a^.HI, x);
      end
      else begin
         buscar:= buscar(a^.HD, x);
       end;
   end;
end;
Function TotClasificador(a:arbol; clas:string):integer;
Begin
  If (a = Nil) Then
    Begin
      TotClasificador:= 0;
    End
  Else
    Begin
      If (a^.dato.clasif = clas) Then
        Begin
          TotClasificador:= 1 + TotClasificador(a^.HI, clas) + TotClasificador(a^.HD, clas);
        End
      Else
        Begin
          TotClasificador:=TotClasificador(a^.HI, clas) + TotClasificador(a^.HD, clas);
        End;
    End;
End;

Function buscarTitulo(a:arbol; t:str70):boolean;
begin
    if( a= nil)  then begin
        buscarTitulo:= false;
    end
    else begin
     if(a^.dato.titulo = t) then begin
        buscarTitulo:= true;
    end
    else
      if(a^.dato.titulo > t ) then begin
            buscarTitulo:= buscarTitulo(a^.HI, t);
      end
      else begin
         buscarTitulo:= buscarTitulo(a^.HD, t);
       end;
   end;
end;
var l:libro; a:arbol;           x:integer; y:str70;
  begin
    LeerLibro(l);
    while (l.ISBN<>0) do begin
        insertarArbol(a,l);
        LeerLibro(l);
    end;
    readln(x);
    buscar(a,x);
    readln(y);
    totClasificador(a,y);
    readln(y);
    buscarTitulo(a,y);
  end.

