{
Un centro de cobro de impuestos necesita un programa que permita que se ingrese un tipo de impuesto y en función del tipo de impuesto se muestre a qué caja 
debe dirigirse para su cobro. Se cobran impuestos de los tipos “X”, “Z”, “P” y “S” , en las cajas 1 a 4 respectivamente. 
Para otros impuestos no hay cajas disponibles
}
program ejer3Clase2;
var tipoImpuesto: char;

BEGIN    
  write('Ingrese su tipo de impuesto: ');  
  read(tipoImpuesto);    
  case tipoImpuesto of
  'Z', 'z' : write ('Se cobra en caja 2');  
  'X', 'x' : write ('Se cobra en caja 1');  
  'P', 'p' : write ('Se cobra en caja 3');  
  'S', 's' : write ('Se cobra en caja 4');  
  else writeln('No hay cajas disponibles para ese tipo de impuesto');
  end;
END.
