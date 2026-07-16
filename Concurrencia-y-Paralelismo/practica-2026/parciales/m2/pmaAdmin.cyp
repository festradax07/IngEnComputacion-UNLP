//3 empleados P personas atendidas, espera a ser atendido por cualquiera

chan solicitud(int, text);
chan respuesta[P](text);
chan siguiente(int);
chan respuestaEmpleado[3](int,text);

Process Persona[id:0..P-1]{
    text res, tramite;
    send solicitud(id,tramite);
    receive respuesta[id](res);
}

Process Admin{
    int i, idP, idE, cant=0;
    text tramite;
    while(cant < P){
        receive siguiente(idE);
        if(not empty(solicitud)){
            receive solicitud(idP,tramite);
            cant++;
        }else idp=0
        send respuestaEmpleado[idE](idP,tramite);
    }
    for i:= 0 to 2{
        receive siguiente(idE);
        send respuestaEmpleado[idE](-1,tramite);
    }
}

Process Empleado[id:0..2]{
    int idP; text tramite, res;

    send siguiente(id);
    receive respuestaEmpleado[id](idP,tramite);
    while (idP> -1){
        if(idP>0){
            res= resolverTramite(tramite);
            send respuesta[idP](res);
        }else delay(5min);

        send siguiente(id);
        receive respuestaEmpleado[id](idP,tramite);
    }
}