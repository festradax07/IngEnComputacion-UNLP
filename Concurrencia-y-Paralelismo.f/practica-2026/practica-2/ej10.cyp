10) Simular la atención en una Terminal de Micros que posee 3 puestos para hisopar a 150
pasajeros. En cada puesto hay una Enfermera que atiende a los pasajeros de acuerdo con
el orden de llegada al mismo. Cuando llega un pasajero se dirige al Recepcionista, quien le
indica qué puesto es el que tiene menos gente esperando. Luego se dirige al puesto y espera
a que la enfermera correspondiente lo llame para hisoparlo. Finalmente, se retira.
a) Implemente una solución considerando los procesos Pasajeros, Enfermera y
Recepcionista.
b) Modifique la solución anterior para que sólo haya procesos Pasajeros y Enfermera,
siendo los pasajeros quienes determinan por su cuenta qué puesto tiene menos personas
esperando.
Nota: suponga que existe una función Hisopar() que simula la atención del pasajero por parte
de la enfermera correspondiente.


int p=150; hisopados=0;
colaPersona puestos[3];
sem espera[p]=([P]0), haypaciente[3]=0;

Process pasajero[id:0..P-1]{
    int min;
    P(mutex)
        min= min(puestos);
        P(mutexcola[min]);
            push (puestos[min],id);
        V(mutexCola[min]);
    V(mutex);
    V(haypaciente[min]);
    P(espera[id]);
    -- me voy
}

Process Enfermera[id:0..2]{
    P(haypaciente[id]);
    P(mutexHisopado)
        while(hisopados <150){
            hisopado++;
            V(mutexHisopado)
            P(mutexCola[id])
            pop(idP,puestos[id]);
            V(mutexCola[id]);
            Hisopar(idP);
            V(espera[idP]);
            if (hisopados < 150){
                P(haypaciente[id]);
            }else{
                V(haypaciente[(id + 1) % 3]);
            }
            P(mutexHisopado)
        }
        V(mutexHisopado)

}