{
Un centro de cobro de impuestos necesita un programa que permita que se ingresen tipos de impuesto y en función del tipo de impuesto se muestre 
a qué caja debe dirigirse para su cobro. El ingreso de impuestos finaliza cuando se ingresa el impuesto ‘@’. 
Se cobran impuestos de los tipos “X”, “Z”, “P” y “S” , en las cajas 1 a 4 respectivamente. 
Para otros impuestos no hay cajas disponibles. }

program ejer4Clase2;
var tipoImpuesto: char;

BEGIN   
 
  write('Ingrese su tipo de impuesto: ');  
  readln(tipoImpuesto); 
  while (tipoImpuesto <> '@') do   
  begin
    case tipoImpuesto of
    'Z', 'z' : writeln ('Se cobra en caja 2');  
    'X', 'x' : writeln ('Se cobra en caja 1');  
    'P', 'p' : writeln ('Se cobra en caja 3');  
    'S', 's' : writeln ('Se cobra en caja 4');  
    else writeln('No hay cajas disponibles para ese tipo de impuesto');
    end;
    write('Ingrese su tipo de impuesto: ');  
    readln(tipoImpuesto);
  end;  
END.

