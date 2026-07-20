Procedure playa is

Task type Persona is;
    entry empezar;
    entry maximo(grupo: in integer);
arrPersonas: array (1..20) of Persona;

Task Body Persona is 
    equipo: integer := saberEquipo();
    total:= Integer := 0;
    id: integer;
Begin
    Accept iden(id:IN int); // asi se quien soy 
    equipos[equipo].llegue();
    accept equipos[equipo].empezar();
    for i in 1..15 LOOP
        total:=total+ Moneda();
    end loop;
    juego.monedas(total,grupo);
    accept maximo(grupoMax: IN integer) do
        if(grupoMax==equipo) THEN
            print("ganeee");
        end if;
    end maximo;
END Persona;

Task TYPE Equipo;
Equipos: array(1..5) of Equipo;

Task BODY Equipo is
    jugadores:array(1..4) of integer;
    for i in 1..4 loop
        accept llegue(in id int);
        jugadores[i]=id;
    end loop;
    for i in 1..4 loop
        arrPersonas(jugadores[i]).empezar();
    end loop;
end Equipo;

Task juego is
    entry monedas (total, grupo: IN integer);
end Juego;

Task body Playa is
    maxGrupo, maxCantidad, grupoActual:integer:=-1;
    arrContador(1..5) of integer;
    arrLlegaron(1..5) of integer;
Begin
    for i in 1..20 loop
        accept monedas(total,grupo: IN integer) DO
            grupoActual:=grupo;
        end monedas;
        arrContador[grupoActual]:= arrContador[grupoActual] +total;
    end LOOP
    maxGrupo:=-1;
    maxCantidad:=-1;
    for i in 1..5 loop
        if(arrContador(i) > maxCantidad) THEN
            maxCantidad:=arrContador(i);
            maxGrupo:=i;
        end if;
    end loop;
    for i in 1..20 loop
        personas(i).maximo(maxGrupo);
    end loop;
end PLAYA;
BEGIN
    for i in 1..20 do
        personas(i).iden(i);
    end loop;
END;