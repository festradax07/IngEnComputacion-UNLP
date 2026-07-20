En un estadio de futbol hay una maquina expendedora de gaseosas que debe ser usada por E Espectadores (una vez cada uno) de acuerdo al orden de llegada. Cuando el espectador accede a la maquina, la usa y luego se retira para dejar al siguiente.


process Persona[E]{
	Admin!llegada(id);
	Maquina?fin();
}
process Administrador{
cola buffer;
int idE;

do Persona[*]?llegada(idE) -->{push(buffer,idE)}
[] not empy(buffer); Maquina?atencion() -->{ pop(buffer,idE);
						Maquina!usar(idE);
						}
od						

}
process Maquina{
int idE;
while (true){
	Administrador!atencion();
	Maquina?Usar(idE);
	Usar();
	Persona[idE]!fin()
}


