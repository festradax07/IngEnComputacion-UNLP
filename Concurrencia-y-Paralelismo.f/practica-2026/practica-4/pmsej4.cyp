c //
process Persona[id:0..P-1]{
    Admin!pedir(id);
    Empleado?libre();
    -- usar simulador
    Empleado!irse();
}

process Admin{
    int idP; cola fila;
    do
        [] Persona[*]?pedir(idP) --> push (fila, idP);
        [] not empty(fila); Empleado?siguiente() --> Empleado!pasar(pop(fila))
    od
}

process Empleado{
    int idP;
    while (true){
        Admin!siguiente();
        Admin?pasar(idA);
        Persona[idA]!libre();
        Persona[idA]?irse();
    }
}
a //
process Persona[id:0..P-1]{
    Empleado!pedido(id);
    Empleado?ok();
    -- usar simulador
    Empleado!irse();
}

process Empleado{
    int idP;
    while (true){
        Persona[*]?pedido(idA);
        Persona[idA]!ok();
        Persona[idA]?irse();
    }
}
b//
process Persona[id:0..P-1]{
    Empleado?pasar();
    -- usar simulador
    Empleado!irse();
}

process Empleado{
    int idP;
    for i=0 to P-1{
        Persona[i]!pasar();
        Persona[i]?irse();
    }
}