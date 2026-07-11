process Espectador[id:0..E-1]{
    Admin!pedir(id);
    Admin?pasar();
    -- uso maquina
    Admin!liberar();
}

process Admin{
    libre = true;
    cola fila;
    do
        []libre; Espectador[*]?pedir(id) --> libre=false; Espectador[id]!Pasar();
        [] not libre; Espectador[*]?pedir(id) --> push (fila,id);
        [] Espectador[*]?liberar() --> {if(empty(fila)) libre=true;
                                        else{
                                            sig=pop(fila);
                                            Espectador[sig]!pasar();}
                                        }
}