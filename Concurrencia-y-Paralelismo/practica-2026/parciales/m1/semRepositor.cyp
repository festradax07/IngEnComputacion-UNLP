sem mutex=1;
sem espera[C]=([C]0);
sem reponer = 0;
sem finReponer=0;
bool libre=true;
cola fila;
int cantLatas=100;

Process Usuario[id:0..U-1]{
    int i, auxU;

    P(mutex)
    if (not libre){
        push (fila, id);
        V(mutex);
        P(espera[id]); //espero mi turno
    }else{
        libre=false;
        v(mutex)
    }

    if(cantLatas==0){
        V(reponer);
        P(finReponer);
    }
    cantLatas--;

    P(mutex)
    if(not empty(fila)){
        sig=pop(fila);
        V(espera[sig]);
    }else{
        libre=true;
    }
    V(mutex)
}

Process Repositor{

    while(true){
        P(reponer);
        cantLatas=100;
        V(finReponer);
    }
}