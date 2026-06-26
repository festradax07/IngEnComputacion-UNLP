2. Resolver con MONITORES el siguiente problema. En una planta verificadora de vehículos existen 5
estaciones de verificación. Hay 75 vehículos que van para ser verificados, cada uno conoce el número de
estación a la cual debe ir. Cada vehículo se dirige a la estación correspondiente y espera a que lo atiendan.
Una vez que le entregan el comprobante de verificación, el vehículo se retira. Considere que en cada estación
se atienden a los vehículos de acuerdo con el orden de llegada. Nota: maximizar la concurrencia.
int V=75,E=5;
// mis recursos son las estaciones, orden de llegada;

Process Vehiculo[id:0..V-1]{
    text compr;
    int idEstacion=darNum();
    Coordinador[id].Pedir()id, comp);
}

Process Estacion[id: 0..E-1]{
    text comp;
    int idV;
    while (true){
        Coordinador[id].sig(idV);
        comp=generarComprobante(idV);
        Coordinador[id].darComprobante(idV,comp);
    }
}
// como cada uno necesita especificamente atender a uno especifico, una solucion serian un coord por 
cada estacion, asegurandome que solo agarra de esa estacion los vehiculos y simplificando las estructuras.
MONITOR ADMIN[ID: 0..E-1]{
    cola autos;
    cond hayVehiculo; esperaE; fin // para sincronizar la salida
    text comp;
    procedure Pedir(idV: in int, C: OUT text){
        push (auto,idV);
        signal(hayVehiculo)
        wait(esperaE);
        c=comp;
        signal(fin) //me fui
    }
    procedure sig(idV:out int){
        if(empty(autos)) wait(hayVehiculo);
        pop(autos,idV);
    }
    procedure darComprobante(idV in int, c in text){
        comp=c;
        signal(esperaE);
        wait(fin)
    }

}