Process Corredor[id:0..C-1]{
    int num, pos;
    adminOrden!quieroNumero(id);
    Coordinador[*]?recibirNumero(num);
    AdminBarrera!listo();
    AdminBarrera?IniciarCarrera();
    CorrerCarrera();
    Meta!quieroPosicion(id);
    Meta?recibirpos(pos);
}

Process AdminOrden{
    Cola cola; int idC,idE;
    do Corredor[*]?quieroNumero(idC) --> push (cola,idC);
        [] not empty(cola),Coordinador[*]?siguiente(idE) --> pop(cola,idC), Coordinador[idE]!atender(idC);
    od
}

Process AdminBarrera{
    for i= 0 to C-1 Corredor[*]?listo();
    for i=0 to C-1 Corredor[i]!IniciarCarrera();
}

Process Coordinador[id:0..2]{
    int idC, num;

    while true{
        AdminOrden!siguiente(id);
        AdminOrden?atender(idC);
        num = darNumero();
        Corredor[idC]!recibirNumero(num);
    }
}

Process Meta {
    int i, idc,POS=1;
    FOR i=0 to c-1 {
        Corredor[*]?quieroPosicion[id];
        Corredor[idC]!recibirpos(i+1);
    }
}