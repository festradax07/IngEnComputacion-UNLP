//a - 1 fotocopiadora compartida por todas las personas, y las mismas 
deben usarla de a uno a la vez, sin orden. fotocopiar()
solo de proceso personas 

##no respeta orden, y obligatoriamente deben entrar para utilizarlo dentro del Monitor
process Persona[id:0..N-1]{
    fotocopiadora.usar()
}

Monitor fotocopiadora{
    procedure usar(){
        fotocopiar()
    }
}
#b - se necesita que el monitor administe el acceso al recurso
process Persona[id:0..N-1]{
    fotocopiadora.pedir()
    fotocopiar()
    fotocopiadora.liberar()
}

Monitor fotocopiadora{
    bool libre = true; /estado del recurso
    cond cola;
    int esperando =0;
    procedure pedir(){
        if (not libre){ esperando++;
                        wait(cola);
        }
        else libre=false;
    }
    procedure liberar(){
        if (esperando>0){
            esperando--;
            signal(cola);
        }else libre=true; // solamente lo pongo libre cuando no hay nadie disponible, de otra forma lo estan usando entre distintas personas consecutivamente
    }
}
