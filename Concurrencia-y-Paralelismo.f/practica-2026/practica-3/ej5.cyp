Process Alumno[id:0..49]{
    Entrada.entrar();
    int numGrupo;
    Grupos.ObtenerNumGrupo(numGrupo);
    -- hacer tarea;
    int nota
    Tareas.EsperarCorreccion(nota,numGrupo);
}

Process JTP{
    Entrada.Avisar();
    for i= 1 to 50{
        Grupos.DarNumero(DarNumero()); //asumimos le da el numero a 2 personas si o si  durante las 50 veces
    }
    for i=1 to 25{
        Tareas.CorregirGrupo();
    }
}

MONITOR ENTRADA{
    int cantidad =0;
    cond estantodos,barera;
    Procedure Entrar(){
        cantidad++;
        if (cantidad==50){ signal(estantodos)}
        wait(barrera);
    }
    Procedure Avisar(){
        if (cantidad<50) wait(estantodos);
        signal_all(barrera);
    
    }
}
MONITOR GRUPOS{
    cola nums;
    cond haynums;
    procedure DarNUmero(num in int){
        push(nums,num);
        signal(haynums);
    }
    procedure ObtenerNumGrupo(num  out int){
        while (empty (nums)) wait(haynums);
        num= pop(nums);
    }
}

MONITOR TAREAS{
    int nota=25;
    cond corregido[25], hayentrega;
    bool llego[25];
    int notagrupo[25];
        Procedure EsperarCorreccion(nota out int,idG in int){
                if (llego[idG]){
                    push(terminaron,idG);
                    signal(hayEntrega);
                }else{
                    llego[idG]=true;
                }  
                wait(corregido[idG]);
                nota=notagrupo[idG];
        }
        
        Procedure CorregirGrupo(){
            while (empty(terminaron)) wait (hayEntrega);
            idG= pop(terminaron);
            notagrupo[idG]=nota;
            nota--;
            signal_all(corregido[idG]);
        }

}