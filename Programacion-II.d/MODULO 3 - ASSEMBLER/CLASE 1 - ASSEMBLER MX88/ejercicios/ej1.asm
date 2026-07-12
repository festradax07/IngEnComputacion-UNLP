      org 1000h  
pp    dw ?  ; define variable de tipo Word inicializada en basura toma lo que hay en memoria
dd    db 3   ; define una variable de tipo byte y la inicializa en  el valor 3 decimal
      ;Inicio de memoria de instrucciones
      org 2000h
      mov AX,pp
      mov BL,dd
      add AX,BX
      hlt
      end

