program VectorOrdenadoHECHO;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;
Function Buscar(v:vector;pri,ult,x:integer):boolean;
var medio:integer;
begin
    if( pri > ult)  then
        buscar:= false
    else begin
    medio:= ((pri + ult) div 2);
    if(v[medio] = x) then begin
        buscar:= true;
    end
    else
      if(x < v[medio]) then begin
            buscar:= buscar(v, pri, medio-1, x);
      end
      else begin
         buscar:= buscar(v,medio+1,ult,x);

end;
end;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim; x:integer;

begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('escribi un numero no negativo');
     writeln('inserte numero');
     readln(x);
     if( Buscar(v,1,dimL,x)) then
         writeln ('el numero existe en el vector')
     else
      writeln ('no existe capo');


     readln;
end.
