Resolver con PMS. En la estación de trenes hay una terminal de SUBE que debe ser usada por P personas de
acuerdo con el orden de llegada. Cuando la persona accede a la terminal, la usa y luego se retira para dejar al
siguiente. Nota: cada Persona una sólo una vez la terminal.

Process Persona[id:0..N-1]{
    Admin!pedido(id);
    Admin?usar();
    --uso terminal SUBE
    Admin!liberar();

}

Process Admin{
    bool libre = true;
    cola personas;
    int idP;
    do
        [] libre;Persona[*]?pedido(idP) --> libre=false; persona[idP]!usar();
        [] not libre; Persona[*]?pedido(idP) --> push (personas,idP);
        [] Persona[*]?liberar() --> {if (empty(personas))libre=true 
                                    else pop(personas,idP); Personas[idP]!usar()}
    od
}