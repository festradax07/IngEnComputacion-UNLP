ORG 1000H
MSJ DB"INGRESE UN NUMERO"
FIN DB ?
ORG 1500H
NUM DB ?
ORG 2000H
MOV BX, OFFSET MSJ ; obtene mensaje
MOV AL, OFFSET FIN-OFFSET MSJ; long para mostrar
INT 7; muestra descripcion
MOV BX, OFFSET NUM ;donde voy a guardar el dato 
INT 6 ; lee desde teclado el numero
MOV AL, 1; longitud de lo que se va a mostrar
INT 7; se muestra NUM debido a que es la dir dentro de bx
MOV CL, NUM; se mueve num para CL
INT 0; fin
END
;int 6 lee un caracter de teclado.
; para se guarda en bx la dir de almacenamiento. ahi quedará despues de hacer int 6
