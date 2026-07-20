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

#c - prioridad de acuerdo a la edad de cada persona. Se necesita una coladeprioridad para el id,
y adicionalmente un arreglo condicion para cada persona, ya que el signal no va a ir por el orden de 
llegada fijo.

process Persona[id:0..N-1]{
    fotocopiadora.pedir()
    fotocopiar()
    fotocopiadora.liberar()
}

Monitor fotocopiadora{
    bool libre = true; /estado del recurso
    cond espera[N];
    int idAux, esperando =0;
    colaPrioridad cola;
    procedure pedir(idP,edad: in int){
        if (not libre){ push (cola,(idP,edad))
                        esperando++;
                        wait(espera[idP]);
        }
        else libre=false;
    }
    procedure liberar(){
        if (esperando>0){
            esperando--;
            pop(cola,idAux);
            signal(espera[idAux]);
        }else libre=true; // solamente lo pongo libre cuando no hay nadie disponible, de otra forma lo estan usando entre distintas personas consecutivamente
    }
}
#d - respetar el orden por el id del proceso



process Persona[id:0..N-1]{
    fotocopiadora.pedir()
    fotocopiar()
    fotocopiadora.liberar()
}

Monitor fotocopiadora{
    int proximo=0;
    cond espera[N];
    int idAux, esperando =0;
    colaPrioridad cola;
    procedure pedir(idP: in int){
        if (idP!= proximo){ // 0 ya esta habiltiado, el resto frena hasta que se libere y avance
            wait(espera[idP])
        }
    }
    procedure liberar(){
        proximo++;
        if (proximo < N){
            signal(espera[proximo]);
        }
    }
}
#e - 

process Persona[id:0..N-1]{
    fotocopiadora.pedir()
    fotocopiar()
    fotocopiadora.liberar()
}
process Empleado{
    fotocopiadora.sig()
}

Monitor fotocopiadora{
    bool libre = true; /estado del recurso
    Cola cola;
    cond pedido;
    cond espera;
    cond finalizar;
    int esperando =0;
    procedure pedir(idC: in int){
        push(cola,idC)
        signal(pedido)
        wait(espera)
    }
    procedure sig(){
        if(empty(cola)) -> wait(pedido);
        pop(cola);
        signal(espera);
        wait(finalizar);

    } 

    procedure liberar(){
        signal(finalizar);
    }
}

#f- 
f) son 10 fotocopiadoras, y el empleado indica a cual puede usar (mayor complejidad)

Process Persona[id: 0..N-1] {
    int idF;
    // ... prepara el documento ...
    
    Admin.Llegada(id, idF);    // Bloqueante: el empleado le asignará una fotocopiadora
    
    Fotocopiadora[idF].Usar(); // Acción larga AFUERA del administrador, concurrente con las otras máquinas
    
    Admin.Salida(idF);         // Libera la máquina para que otros la usen
}

Process Empleado {
    while (true) {
        Admin.proximo(); // Coordina de a una asignación por vez
    }
}

Monitor Admin {
    Cola c_personas;         // Cola FIFO de la lógica (almacena IDs de personas)
    Cola c_fotocopiadoras;   // Cola con los IDs de las fotocopiadoras que están libres
    
    int res[N];              // Arreglo indexado por ID de persona para guardar el ID de fotocopiadora asignada
    
    // Variables de condición
    cond esperar[N];         // Arreglo de condiciones individuales (una "cama" por persona)
    cond atencion;           // Para despertar al empleado cuando hay trabajo pendiente

    // Inicialización del Estado del Monitor
    init() {
        // Al principio, las 10 fotocopiadoras (0 a 9) están libres
        for (int i = 0; i < 10; i++) {
            push(c_fotocopiadoras, i);
        }
    }

    procedure Llegada(int id, out int idF) {
        push(c_personas, id);      // La persona se anota en la cola por orden de llegada
        signal(atencion);          // Despierta al empleado si estaba durmiendo en una silla
        
        wait(esperar[id]);         // ¡Clave! La persona se duerme en SU condición privada
        
        idF = res[id];             // Al despertar, retoma con seguridad la máquina que le asignaron
    }

    procedure proximo() {
        // El empleado SOLO trabaja si hay un cliente esperando Y una fotocopiadora libre
        while (empty(c_personas) || empty(c_fotocopiadoras)) {
            wait(atencion); 
        }

        // Saca de forma segura los elementos correspondientes
        int prox_persona = pop(c_personas);
        int fotocopiadora_libre = pop(c_fotocopiadoras);

        // Hace la asignación en la estructura intermedia
        res[prox_persona] = fotocopiadora_libre;

        // Despierta quirúrgicamente a la persona que le toca pasar
        signal(esperar[prox_persona]);
    }

    procedure Salida(int idF) {
        push(c_fotocopiadoras, idF); // Devuelve la máquina a la fila de disponibles
        signal(atencion);            // Avisa al empleado por si había alguien esperando máquina
    }
}

Monitor Fotocopiadora[id: 0..9] {
    procedure Usar() {
        Fotocopiar(); // Exclusión mutua garantizada para CADA fotocopiadora individual
    }
}