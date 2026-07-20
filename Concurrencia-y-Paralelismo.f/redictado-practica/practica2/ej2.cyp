3. Se tiene un curso con 40 alumnos, la maestra entrega una tarea distinta a cada alumno, luego 
cada alumno realiza su tarea y se la entrega a la maestra para que la corrija, esta revisa la tarea 
y si está bien le avisa al alumno que puede irse, si la tarea está mal le indica los errores, el 
alumno corregirá esos errores y volverá a entregarle la tarea a la maestra para que realice la 
corrección nuevamente, esto se repite hasta que la tarea no tenga errores.

---------------------------------------------------------------------------
- puedo pensar en la maestra como un proceso compartido entre los alumnos, ya que deben enviarle la informacion al respecto
sem mutex = 1;
sem espera[40] = ([40] 0);      // semáforo privado para cada alumno
sem maestra = 0;                // indica que hay tareas para corregir
cola C;                         // cola de tareas entregadas
Tarea t[40];                    // tarea original de cada alumno
int resultados[40];            // 1 si está bien, 0 si tiene errores
bool aprobado[40] = ([40] false);


Process alumno [1..N]{
    Tarea t;
    P(espera[id]); //el alumno espera que la maestra le entregue la tarea

    while (!aprobado[id]){
        Tarea tarea = t[id]; //recibe su tarea original
        //resuelve la tarea

        P(mutex);
        push(C, id, tarea); //entrega la tarea a la maestra
        V(mutex);

        V(maestra); //le avisa a la maestra que hay tarea para corregir

        P(espera[id]); //espera la correccion de la tarea
    }
}

Process Maestra{
	int aprobados=0;
    //entrega inicial de tareas
    for i=0 to 40{
        t[i] = tarea(i); //crea una tarea diferente para cada uno de los 40 alumnos 
        V(espera[id]); //habilita a cd alumno para que comience a trabajar
    }

    //comienza a corregir tareas
    while(aprobados <40 ){ 

        P(maestra); //espera a que haya al menos una tarea para corregir

        P(mutex); 
        pop(C, (id,tarea) ); //toma una tarea para corregir
        V(mutex);

        if(tareaBienHecha){
            aprobado[id] = true; //este alumno no entregara mas
	    aprobados++;
        }else{
            indicar_errores(id); //el alumno debera corregir y volver a entregar
        }
        
        V(espera[id]); //avisa al alumno que puede seguir

    }
}
