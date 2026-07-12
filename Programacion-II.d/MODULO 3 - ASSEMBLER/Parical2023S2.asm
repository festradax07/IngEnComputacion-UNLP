 org 1000h  
palindromo    db "arenera"  ; define variable de tipo Word inicializada en basura toma lo que hay en memoria    db 5  ; define una variable de tipo byte y la inicializa en  el valor 3 decimal
res db ?      
      ;Inicio de memoria de instrucciones
      org 3000h
      EQUALS: push bx
      mov bx, sp
      add bx, 4
      push cx
      mov cx,bx 
      push ax
      push dx
cambio: mov bx,ax
      mov al,[bx]
      mov bx, dx
      cmp [bx],al
      jz iguales
      mov bx, cx
      mov byte ptr[bx], 00h
      jmp fin_equals
iguales: mov bx,cx
      mov byte ptr[bx],0FFh
fin_equals:pop dx 
pop ax
pop cx
pop bx
ret

      org 2000h
      mov AX,offset palindromo
      MOV dX,offset res-1
      mov cl,00
      mov ch,0
loop: push cx
      CALL EQUALS
      pop cx
      cmp cl,0FFh
      jnz sigo
      inc ch
  sigo:inc ax
      dec dx
      cmp ax,dx
      js loop
      mov res,ch
      hlt
      end
