{
Un centro de cobro de impuestos necesita un programa que permita que se ingrese un tipo de impuesto y en función del tipo de impuesto se muestre 
a qué caja debe dirigirse para su cobro. Los impuestos de tipo “X” se cobran en la caja 1 y los tipo “Z” en la caja 2. 
Para otros impuestos no hay cajas disponibles.
}

program ejer2Clase2;
var tipoImpuesto: char;

BEGIN    
  write('Ingrese su tipo de impuesto:');  
  read(tipoImpuesto);    
  if (tipoImpuesto = 'x') or (tipoImpuesto = 'X')
  then writeln('Ir a caja 1')
  else if (tipoImpuesto = 'z') or (tipoImpuesto = 'Z')
       then writeln('Ir a caja 2')
       else writeln('No hay cajas disponibles para ese tipo de impuesto');
END.
