process Alumno[id:0..N-1]{
    int idP;
    Examen.Llegar(id,idP);
    Escritorio[idP].rendirOral(nota,id);

}
process Profe[id:0..N-1]{
    bool continuar=true;
    while (continuar) do {
        Examen.atenderAlumnado(continuar);
        if(continuar){
            Mesa[id].evaluar();
            res=decidirnota();
            Mesa[id].darNota(res);
        }
    }

}
Monitor Examen {
    cola profeslibres;
    cond esperaA;
    int esperando=0;cantlibres=0;
    
    procedure llegar(idP: out int){
        if (cantlibres==0){
            esperando++;
            wait(esperaA);
        }else{cantlibres--}
        pop(profeslibres,idP);
    }
    procedure atenderAlumnado(idP: in int){
        push (profeslibres,idP);
        if (esperando > 0){
            esperando--;
            signal(esperaA);
        }else cantlibres++;

    }

}

Monitor Escritorio[id:0..2]{
    cond vcAlu, vcProfe, salir;
    boolean listo=false; // para el estado
    int resultado;
    procedure rendirOral(res: out int){
        listo=true; // termino de dar rendirOral
        signal(vcProfe);
        wait(vcAlu);
        res=resultado;
        signal(salir);
    }

    procedure evaluar(){
        if(not listo){ wait(vcProfe)}
    }
    procedure darNota(R: in int){
        resultado=R;
        signal(vcAlu);
        wait(salir); // espero a que se vaya
        listo=false;
    }

}