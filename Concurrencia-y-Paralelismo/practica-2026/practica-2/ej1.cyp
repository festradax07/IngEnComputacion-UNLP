Existen N personas que deben ser chequeadas por un detector de metales antes de poder
ingresar al avión.
a) Analice el problema y defina qué procesos, recursos y semáforos/sincronizaciones serán
necesarios/convenientes para resolverlo.
b) Implemente una solución que modele el acceso de las personas a un detector (es decir,
si el detector está libre la persona lo puede utilizar; en caso contrario, debe esperar).
c) Modifique su solución para el caso que haya tres detectores.
--------------------------------------------------------------------
sincronizacion por exclusion mutua
b)

sem mutex_detector=1;
process Persona[id:0..n-1]{ 
	p(mutex_detector) // usarlo
	pasar();
	v(mutex_detector);
	abordar();

}

c) 

sem mutex_detector=3 // 3 recursos disponibles
process Persona[id:0..n-1]{
	p(mutex_detector);
	pasar();
	v(mutex_detector);
	abordar();
}

