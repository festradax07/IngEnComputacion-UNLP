Process Alumno[id:0..N-1]{
    Profesor[0]!llegue();
    Profesor[0]?comenzar();
    resolver= resolverExamen(examen);
    BufferResueltos!resolucion(resolver,id);
    BufferCorrecion!corrigieron(id);
    BufferCorrecion?correcion(respuesta);
}

Proces Profesor[id:0..P-1]{
    if id=0{
        for i=0 .. N-1 {
            Alumno[*]?llegue(); // recibo la barrera de todos los alumnos
        }
        for i=0 .. N-1{
            Alumno[i]!comenzar();
        }
    }// solo para el titular (prof 0)
    while true{
        BufferResueltos!entregaron(idP);
        BufferResueltos?darExamen(idA,examen);
        resp=corregir(examen);
        BufferCorrecion!darCorrecion(nota,idA);
    }
}

Process BufferResueltos{ 
    cola resueltos,corregidos;
    do Alumno[*]?resolucion(examen,idA)-> push(resueltos,(examen,idA));
        [] not empty(resueltos); Profesor[*]?entregaron(idP)-> {pop(corregidos,(nota,idA)); Profesor[idP]!darExamen(examen,idA)}
    od
}       

Process BufferCorrecion{ 
    cola resueltos,corregidos;
    do Profesor[*]?darCorrecion(examen,idA)-> push(corregidos,(nota,idA));
        [] not empty(corregidos); Alumno[*]?corrigieron()-> {pop(corregidos,(nota,idA)); Profesor[idA]!darExamen(nota)}
    od
}  