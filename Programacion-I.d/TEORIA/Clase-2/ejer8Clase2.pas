{
Escribir un programa que informe las superficies de terrenos cuyas dimensiones se leen de teclado.
 El ingreso de datos finaliza cuando se ingresa un terreno cuya superficie supera los 1000 mt2.

}

program ejer8Clase2;
var frente,fondo,superficie:real;
    
BEGIN    
  repeat        
    write('Ingrese frente: ');        
    readln(frente);        
    write ('Ingrese fondo: ');        
    readln(fondo);        
    superficie := frente * fondo;        
    writeln('La superficie es: ', superficie:2:2);    
  until (superficie > 1000);
END.
