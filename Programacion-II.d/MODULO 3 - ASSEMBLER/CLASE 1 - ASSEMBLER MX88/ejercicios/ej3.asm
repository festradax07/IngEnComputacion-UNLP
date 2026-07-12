ORG 1000H
NUM0 DB 0CAH
NUM1 DB 0
NUM2 DW ?
NUM3 DW 0ABCDH
NUM4 DW ?

ORG 2000H
MOV BL, NUM0; direccionamiento directo memoria
MOV BH, 0FFH; inmediato
MOV CH, BL; de registro
MOV AX, BX; de registro
MOV NUM1, AL;  directo de registro (importa lo que está al derecho de la coma)
MOV NUM2, 1234H; inmediato
MOV BX, OFFSET NUM3; directo memoria
MOV DL, [BX]; de registro indirecto
MOV AX, [BX]; de registro indirecto
MOV BX, 1006H; inmediato
MOV WORD PTR [BX], 1006H; inmediato , convierte el numero en un word y lo asigna en 1006h
HLT
END