org 1000h
vocales db "AaEeIiOoUu"
FINVOCALES DB ?
org 1500h
CADENA DB ?,?,?
fin db 0

org 3000h
ES_VOCAL: PUSH BX
          PUSH CX; CL, DATO CARACTER
          ; AH RESULT TRUE O FALSE
          MOV BX, OFFSET VOCALES
          MOV CH, OFFSET FINVOCALES -OFFSET VOCALES
          CMP CH, 0
          JZ FIN_ESVOCAL
LOOP_ESVOCAL: CMP BYTE PTR [BX], CL
              JNZ NEXT_VOCAL
              MOV AH, 0FFH
              JMP FIN_ESVOCAL
NEXT_VOCAL:  INC BX
              DEC CH
              JNZ LOOP_ESVOCAL
              MOV AH, 00H
FIN_ESVOCAL: POP CX
            POP BX
            RET; RETORNO POR AH RESULT



CONTAR_VOC: PUSH BX
            PUSH CX
            MOV AX, 0
            CMP CH, 0
            JZ FINCONTAR
LOOP_CONTAR: MOV CL, [BX] 
            CALL ES_VOCAL
            CMP AH, 0FFH
            JNZ NEXT
            INC AL
      NEXT: INC BX
            DEC CH
            JNZ LOOP_CONTAR
FINCONTAR:POP CX
          POP BX
          RET ; devuelve por AL la cantidad



leer_str_n: PUSH BX ; BX TIENE DIRECCION DEL 1ER ELEM DE LA CADENA
            PUSH CX; CH TIENE LA CANTIDAD A LEER
            CMP CH, 0
            JZ FIN_STR
      LOOP: INT 6
            INC BX ; AVANZO
            DEC CH
            JNZ LOOP
FIN_STR: POP CX
         POP BX
         RET
ORG 2000H
MOV BX, OFFSET CADENA
MOV CX, 0
MOV CH, OFFSET FIN - OFFSET CADENA
call leer_str_n
call CONTAR_VOC
ADD AL, 30H ; LE AÑADO AL VALOR NUMERICO DE VOCALES (DEBE SER MENOR A 10 PARA FUNCIONAR CORRECTAMENTE)
MOV FIN, AL ; COLOCO AL FINAL DE LA CADENA LA CANTIDAD
INC CH
MOV AL, CH
INT 7
hlt
end
