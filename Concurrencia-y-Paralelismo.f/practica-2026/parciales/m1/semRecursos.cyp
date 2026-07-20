N personas 1 terminal
cola c;
bool libre=true;
sem mutexTurno[P]=([P]0); mutex_cola=1;
process Persona[id:0..P-1]{
    P(mutex_cola)
        if(not libre){
            push(c,id);
            V(mutex_cola)
            P(mutexTurno[id]);
        }else{
            libre=false;
            V(mutex_cola);
        }
    
    UsarTerminal();
    
    P(mutex_cola)
    if(not empty(cola)){
        sig= pop(cola,id)
        V(mutexTurno[sig]);
    }else{
        libre=true
    }
    V(mutex_cola)
}


N personas con T terminales disponibles

sem mutex_personas=1; mutex_terminales=1;
sem esperar[P]=([P]0)
int terminales=T;
cola personas;
cola Terminales;

process Persona[id:0..P-1]{
    P(mutex_persona);
    if (terminales==0){
        push(personas,id);
        V(mutex_persona);
        P(esperar[id])
    }else{
        terminales--;
        V(mutex_cola);
    }

    P(mutex_terminales)
    pop(Terminales)
    V(mutex_terminales)
    UsarTerminal()

    P(mutex_cola)
    if(not empty(personas)) {
        sig = Pop(personas);
        V(esperar[sig]);
    }else{
        terminales++;
    }  
    V(mutex_cola);

}
