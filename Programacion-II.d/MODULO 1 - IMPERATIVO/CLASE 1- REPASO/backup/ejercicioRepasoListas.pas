Program ejercicioRepasoListas;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2023;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;
     prodOrd=record
               codigo:integer;
               nombre: string;
               anio:2000..2023;
               precio:real;
     end;

     listaNew= ^nodoN; {lista contenedora de todos los datos}
     nodoN=record
       dato:prodOrd;
       sig:listaNew;
     end;
     data = record
       marca:string;
       l:listaNew;
     end;
     listaL= ^nodoL; {lista de listas}
       nodoL=record
         dato:data;
         sig:listaL;
         end;

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;

   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto- ', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto ', nombre, ' con codigo ',codigo, ': MARCA:', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;
procedure insertar_ordenado (var pri: listaProductos; l: listaProductos);
var
  nue, ant, act: listaProductos;
begin
    new (nue);
    nue^.dato := l^.dato;
    nue^.sig := nil;
    act := pri;
    ant := pri;
    {BUSCAMOS LA POSICION A INSERTAR}
    while (act <> nil) and (l^.dato.marca > act ^.dato.marca) do begin
        ant  := act;
        act := act^.sig;
    end;
    if (act = pri) then begin {NO AVANZO EN EL WHILE, PUES ESTA VACIA O INSERTA ADELANTE}
        nue^.sig := pri;
        pri      := nue;
    end
    else begin           {AVANZO EN EL WHILE. SIRVE PARA MEDIO Y FIN DE LA LISTA}
        ant^.sig := nue;
        nue^.sig := act; {CUANDO INSERTA AL FINAL, lactual VALE nil}
    end;
end;
procedure CrearListaOrd(var l_Ord:listaProductos; l:listaProductos);
begin
    while (l<>nil) do begin
            insertar_ordenado(l_Ord,l);
            l:=l^.sig;
    end;
end;

Procedure AgregarSubL (var lnew:listaNew; var ultP:listaNew; data:producto);
Var nue:listaNew;
Begin
 new(nue);
 nue^.dato.codigo:=data.codigo;
 nue^.dato.nombre:=data.nombre;
 nue^.dato.anio:=data.anio;
 nue^.dato.precio:=data.Precio;
 nue^.sig:= Nil;
 if (lNew <> nil) then begin
     ultP^.sig:= nue;
 end
 else begin
     lNew:= nue;
  end;
 ultP:=nue;
End;
procedure agregarData(var ll:listaL; marca:string);
var aux:listaL;
begin
 new(aux);
 aux^.dato.marca:= marca;
 aux^.dato.l:=nil;
 aux^.sig:=ll;
 ll:=aux;
end;

procedure generarListadeLista (var ll: listaL; l_Ord: listaProductos);
 var ultP:listaNew;
begin
     while(l_Ord <> nil)do begin
          agregarData(ll,l_Ord^.dato.marca);
          ultP:=nil;
          while(l_Ord<>nil) and ( ll^.dato.marca = l_Ord^.dato.marca)do begin
              AgregarSubL(ll^.dato.l,ultP,l_Ord^.dato);
              l_Ord:= l_Ord^.sig;
          end;
end;
end;
procedure imprimir2(p: prodOrd);
begin
     with (p) do begin
          writeln('Producto ', nombre, ' con codigo ',codigo, 'Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;
procedure imprimirListaNew(l: listaNew);
begin
     while (l <> nil) do begin
            imprimir2(l^.dato);
          l:= l^.sig;
     end;
end;
procedure imprimirll(ll:listaL);
begin
while (ll <> nil) do begin
          writeln('MARCA: ',ll^.dato.marca);
          imprimirlistaNew(ll^.dato.l);
          ll:= ll^.sig;
     end;
end;


var
   l,l_Ord: listaProductos; ll:listaL;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     l_ord:= nil;
     CrearListaOrd(l_ord,l);
     writeln ('Lista ORDENADA POR MARCA: ');
     imprimirLista(l_ord);
     ll:=nil;
     generarListadeLista(ll,l_Ord);
     writeln('----LISTA DE LISTAS ORDENADA POR MARCA----');
     imprimirll(ll);
     writeln('---FIN DEL PROGRAMA---');


     readln;
end.

