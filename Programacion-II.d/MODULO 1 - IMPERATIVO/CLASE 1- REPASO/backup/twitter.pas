Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;
     ntweet= record
        mensaje:string;
        esRetweet:boolean;
     end;

     lista1=^nodo1 ;
     nodo1= record
         dato:ntweet;
         sig:lista1
           end;
     datos = record
          codigo:integer;
          nombre:string;
          l:lista1;
          end;
     lista2= ^nodo2 ;
     nodo2=record
          dato:datos;
          sig:lista2;
     end;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';

     t.codigoUsuario := random(11);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := v[t.codigoUsuario];
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(11);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) do begin
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


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     listaOrdenada := nil;
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.dato);
          lT := lT^.sig;
     end;
end;

Procedure AgregarTweets (var ltweets:lista1; var ultT:lista1; data:tweet);
Var nue:Lista1;
Begin
 new(nue);
 nue^.dato.mensaje:=data.mensaje;
 nue^.dato.esRetweet:=data.esRetweet;
 nue^.sig:= Nil;
 if (ltweets <> nil) then begin
     ultT^.sig:= nue;
 end
 else begin
     ltweets:= nue;
  end;
 ultT:=nue;
End;
procedure agregarData(var l2:lista2;cod:integer; nom:string);
var aux:lista2;
begin
 new(aux);
 aux^.dato.nombre:=nom;
 aux^.dato.codigo:=cod;
 aux^.dato.l:=nil;
 aux^.sig:=l2;
 l2:=aux;
end;

procedure generarListadeLista (var l2: lista2; listaOrdenada: listaTweets);
 var ultT:lista1;
begin
     while(listaOrdenada <> nil)do begin
          agregarData(l2,listaOrdenada^.dato.codigoUsuario,listaOrdenada^.dato.nombreUsuario);
          ultT:=nil;
          while(listaordenada<>nil) and ( l2^.dato.nombre = listaOrdenada^.dato.nombreUsuario)do begin
              AgregarTweets(l2^.dato.l,ultT,listaOrdenada^.dato);
              listaOrdenada:= listaOrdenada^.sig;
          end;
end;
end;
procedure imprimirLista1(l: lista1);
begin
     while (l <> nil) do begin
          writeln('tweet',l^.dato.mensaje);
          writeln('es rt?',l^.dato.esRetweet);
          l:= l^.sig;
     end;
end;
procedure imprimirl2(l2:lista2);
begin
while (l2 <> nil) do begin
          writeln('NOMBRE USUARIO',l2^.dato.nombre);
          writeln ('Codigo de usuario',l2^.dato.codigo);
          imprimirlista1(l2^.dato.l);
          l2:= l2^.sig;
     end;
end;

var l, l_ordenada: listaTweets; l2:lista2;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);
     l2:=nil;
     generarListadeLista(l2,l_ordenada);
     imprimirl2(l2);

     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.
