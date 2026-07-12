org 1000h
vocales db "AaEeIiOoUu"
FINVOCALES DB ?
org 1500h
CADENA DB ?,?,?
ORG 1600H
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
  LOOP_CONTAR: CMP BYTE PTR[BX],CH
            JZ FINCONTAR
             MOV CL, [BX] 
            CALL ES_VOCAL
            CMP AH, 0FFH
            JNZ NEXT
            INC AL
      NEXT: INC BX
            JMP LOOP_CONTAR
FINCONTAR:POP CX
          POP BX
          RET ; devuelve por AL la cantidad



leer_str_car: PUSH BX ; BX TIENE DIRECCION DEL 1ER ELEM DE LA CADENA
              push cx; parametro de fin en cH
      LOOP: INT 6
            CMP BYTE PTR[BX],CH
            JZ FIN_STR
            INC BX ; AVANZO
            JMP LOOP
FIN_STR: POP CX 
         POP BX
         RET
Mostrar_str_Vocal: push bx
      push cx
      while: cmp Byte PTR[BX],CH
      jz fin_Mostrar
      mov al, 1
      int 7
      INC BX
      jmp while
     fin_Mostrar:mov [bx],ah
                 int 7
                 POP CX
                 pop bx
                 ret
ORG 2000H
MOV BX, OFFSET CADENA
MOV CH, 2EH;
call leer_str_car
call CONTAR_VOC
ADD AL, 30H ; LE AÑADO AL VALOR NUMERICO DE VOCALES (DEBE SER MENOR A 10 PARA FUNCIONAR CORRECTAMENTE)
mov ah, al
call Mostrar_str_Vocal
hlt
end
