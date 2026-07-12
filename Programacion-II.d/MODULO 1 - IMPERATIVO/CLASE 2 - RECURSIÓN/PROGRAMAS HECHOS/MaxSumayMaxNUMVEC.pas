program MaxSumayMaxNUMVEC;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



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
function Maximo(v:vector; diml,i,max:integer):integer;
begin
     if (i > diml) then
         Maximo:= max
     else begin
     if ( v[i] > max ) then begin
        max:= v[i];
     end;
     Maximo:= Maximo(v,diml,i+1,max);
     end;
end;

function Suma(v:vector;diml,i:integer):integer;
begin
     if( i> diml) then begin
         Suma:=0
     end
     else begin
        Suma:= (v[i] +(Suma(v,diml,i+1)));
     end;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim; maxi:integer;

begin

     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     maxi:= Maximo(v,dimL,1,-1);
     writeln( ' numero maximo del vector: ', maxi);
     writeln(' suma de los numeros del vector: ', Suma(v,dimL,1));
     readln;
end.
