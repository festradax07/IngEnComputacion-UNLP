Process Cliente[id:0..N-1]{
    Coordinador!atencion(id);
    Empleado?tanqueCargado();
}

Process Coordinador{

    int idC;
    Cola cola;
    do
        Coordinador[*]?atencion(idC) ---> push(cola, idC);
        not empty(cola); Empleado?siguiente() --> pop(cola,idC); Empleado!darCliente(idC); 
}

Process Empleado{
    int idC;   
        while(true){
            Coordinador!siguiente();
            Coordinador?darCliente(idP);
            atender(idP);
            Cliente[idP]!tanqueCargado();
        }

}