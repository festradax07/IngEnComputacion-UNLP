En un examen final hay P alumnos y 3 profesores. Cuando todos los alumnos han llegado comienza el examen. Cada alumno resuelve su examen, lo entrega y espera a que alguno de los profesores lo corrija y le indique la nota. Los profesores corrigen los exámenes respetando el orden en que los alumnos van entregando. Nota: maximizar la concurrencia; no generar demora innecesaria; todos los procesos deben terminar.

process Alumno[id:0..P-1]{

Administrador!Llegue(); // me presneto
Administrador?Comenzar() // espero a que lleguen todos para arrancar.
Examen e = hacerExamen();
Administrador!Entregar(e,id)
Profesor[*]!resultado(nota);

}

process Administrador{
cola buffer;
	for(i=0..P-1) Alumno[*]?Llegue();
	for (i=0..P-1)Alumno[i]!Comenzar();
	do (cant <P);)Alumno[*]?Entregar(e,idE) --> {push(buffer,e,idE);cant++; }
	[] not empty(buffer);Profesor[*]?paraCorregir(idP) --> pop (buffer,e,idE); Profesor[idP]!corregir(e,idE);

}

process Profesor[id:0..2]{

	Administrador!paraCorregir(id); // primer llamado para empezar a soliticar
	do (Profesor[id]?corregir(e,idE) --> { nota=corrijo(e); Alumno[idE]!resultado(nota), Administrador!paraCorregir(id)}
	[] (Profesor[id]?fin()) -- > skip;
	do

}
