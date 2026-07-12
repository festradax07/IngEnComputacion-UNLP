Program twitter_ayu;
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
     end;                  {todo lo cedido por la maquina}
     tuit= record
        mensaje:string;
        esRetweet:boolean;
     end;

     listaTuits= ^nodo1;
     nodo1= record
         dato:tuit;
         sig:listaTuits; {la lista de tuits, que estará dentro de los lados de la listaUsuarios}
           end;
     datos = record
          codigo:integer;
          nombre:string;
          l:listaTuits;
          end;
     listaUser= ^nodo2 ;
     nodo2=record
          dato:datos;
          sig:listaUser;
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

Procedure AgregarTweets (var ltuits:listaTuits; var ultT:listaTuits; data:tweet);
Var nue:listaTuits;
Begin
 new(nue);
 nue^.dato.mensaje:= data.mensaje;
 nue^.dato.esRetweet:= data.esRetweet;
 nue^.sig:= Nil;
 if (ltuits <> nil) then begin       {es un agregar al final, pero en este ej puede ser cualquier agregar}
     ultT^.sig:= nue;
 end
 else begin
     ltuits:= nue;
  end;
 ultT:=nue;
End;
procedure agregarData(var lUser:listaUser;cod:integer; nom:string);
var aux:listaUser;
begin
 new(aux);
 aux^.dato.nombre:= nom;
 aux^.dato.codigo:= cod;
 aux^.dato.l:= nil;
 aux^.sig:=lUser;             {agregara adelante datos}
 lUser:=aux;
end;

procedure generarListadeLista (var lUser: listaUser; listaOrdenada: listaTweets); {se generará a partir de una listadeLista vacia y una lista ordenada por x parametro}
 var ultT:listaTuits;
begin
     while(listaOrdenada <> nil)do begin {mientras la lista no esté vacia}
          agregarData(lUser,listaOrdenada^.dato.codigoUsuario,listaOrdenada^.dato.nombreUsuario);
          ultT:=nil;
          while (listaOrdenada<>nil) and( lUser^.dato.nombre = listaOrdenada^.dato.nombreUsuario)do begin  {consultar comparacion con un nil}
              AgregarTweets(lUser^.dato.l,ultT,listaOrdenada^.dato);
              listaOrdenada:= listaOrdenada^.sig;
          end;
end;
end;
procedure imprimirLista1(l: listaTuits);
begin
     while (l <> nil) do begin
          writeln('tweet',l^.dato.mensaje);
          writeln('es rt?',l^.dato.esRetweet);
          l:= l^.sig;
     end;
end;
procedure imprimirl2(l2:listaUser);
begin
while (l2 <> nil) do begin
          writeln('NOMBRE USUARIO ',l2^.dato.nombre);
          writeln ('CODIGO DE USUARIO',l2^.dato.codigo);      {se deben recorrer en dos procesos por valor diferentes. explicar caso contrario}
          imprimirlista1(l2^.dato.l);
          l2:= l2^.sig;
     end;
end;

var l, l_ordenada: listaTweets; l2:listaUser;
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

