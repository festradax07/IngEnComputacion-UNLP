;          PROGRAMA REALIZADO POR 
;               EMANUEL BORDA 
;COMO EJERCICIO EXTRA A LA PRACTICA 6 DEL CURSO 2010
;        ARQUITECTURA DE COMPUTADORAS
;	    Facultad de Informática
;		    UNLP
;para simulador WinMIPS64
;
	.data
coorX:	.byte 24 		; coordenada X de un punto
coorY:	.byte 46 		; coordenada Y de un punto
colorA: .byte 0, 0, 0, 0 	; color negro
colorB: .byte 255, 255, 0, 0 	; color amarillo
CONTROL: .word32 0x10000
DATA: 	.word32 0x10008
autor:	.asciiz "Emanuel Borda - 2010"
;------------------------------------------------------------------------------------
	.text
	lwu r24, DATA(r0)  	; r24 = dirección de DATA
	lbu r10, coorX(r0) 	; r10 = valor de coordenada X
	lbu r11, coorY(r0) 	; r11 = valor de coordenada Y

;CONTORNO DEL CUERPO

	daddi r17,r0,-1
	daddi r26,r0,2
loop:	lwu r9, colorA(r0) 	; r9 = valor de color a pintar
	sw r9, 0(r24) 	   	; DATA recibe el valor del color a pintar         

	daddi r13,r0,13  
	jal lineaVertical 

	daddi r13,r0,7 
	dadd r10,r10,r17
	jal lineaVertical

	daddi r18,r0,3	
rep:	daddi r13,r0,6 
	dadd r10,r10,r17
	daddi r18,r18,-1
	jal lineaVertical
	bnez r18,rep
	
	daddi r18,r0,2
rep2:	daddi r13,r0,5 
	daddi r18,r18,-1
	jal dibujar
	bnez r18,rep2

	daddi r13,r0,5 
	jal dibujar

	daddi r13,r0,15 
	dadd r10,r10,r17
	jal lineaVertical

	daddi r13,r0,15 
	jal dibujar

	daddi r13,r0,28 
	dadd r10,r10,r17
	jal lineaVertical

	daddi r13,r0,27 
	jal dibujar
	
	daddi r13,r0,18 
	daddi r11,r0,35
        dadd r10,r10,r17
	jal lineaVertical
	
	daddi r13,r0,14 
	daddi r11,r11,-2
        dadd r10,r10,r17
	jal lineaVertical	
	
	daddi r13,r0,10 
	daddi r11,r11,-2
        dadd r10,r10,r17
	jal lineaVertical	

	daddi r13,r0,8 
	daddi r11,r11,-2
        dadd r10,r10,r17
	jal lineaVertical

	daddi r13,r0,8 
	jal dibujar

	daddi r13,r0,7 
	jal dibujar

	daddi r13,r0,7 
	jal dibujar

	
	daddi r13,r0,7 
	jal dibujar

	daddi r13,r0,7 
	jal dibujar

	daddi r13,r0,6 
	jal dibujar

	daddi r13,r0,4 
	daddi r11,r11,-2
        dadd r10,r10,r17
	jal lineaVertical

	daddi r13,r0,2 
	daddi r11,r11,-2
        dadd r10,r10,r17
	jal lineaVertical

		
	daddi r11,r0,46
	daddi r10,r0,25
	daddi r17,r17,2
	daddi r26,r26,-1	
	bnez r26,loop

;ojo izquierdo
	
 	daddi r10,r0,21
	daddi r11,r0,37
	daddi r13,r0,3
	jal lineaVertical

	daddi r10,r0,20
	daddi r11,r0,37
	daddi r13,r0,3
	jal lineaVertical

	
	daddi r11,r0,33
	daddi r13,r0,1
	jal lineaVertical
	
	daddi r10,r0,19
	daddi r11,r0,33
	daddi r13,r0,2
	jal lineaVertical

	daddi r10,r0,18
	daddi r11,r0,33
	daddi r13,r0,3
	jal lineaVertical

	daddi r10,r0,17
	daddi r11,r0,33
	daddi r13,r0,4
	jal lineaVertical	

;ojo derecho

	daddi r10,r0,28
	daddi r11,r0,37
	daddi r13,r0,3
	jal lineaVertical
	
	daddi r10,r0,29
	daddi r11,r0,37
	daddi r13,r0,3
	jal lineaVertical
	
	daddi r11,r0,33
	daddi r13,r0,1
	jal lineaVertical

	daddi r10,r0,30
	daddi r11,r0,33
	daddi r13,r0,2
	jal lineaVertical

	daddi r10,r0,31
	daddi r11,r0,33
	daddi r13,r0,3
	jal lineaVertical

	daddi r10,r0,32
	daddi r11,r0,33
	daddi r13,r0,4
	jal lineaVertical

;ENTREPIERNA
	
	daddi r18,r0,6
	daddi r19,r0,22
saltoi:	dadd r10,r0,r19
	daddi r11,r0,10
	daddi r13,r0,2
	daddi r18,r18,-1
	daddi r19,r19,1
	jal lineaVertical
	bnez r18,saltoi

	lwu r9, colorB(r0) 	; r9 = valor de color a pintar
	sw r9, 0(r24) 	   	; DATA recibe el valor del color a pintar 

;PICO izq
	
	daddi r11,r0,33
	daddi r10,r0,21
	daddi r13,r0,1
	jal lineaVertical

	daddi r11,r0,33
	daddi r10,r0,22
	daddi r13,r0,2
	jal lineaVertical
	
	daddi r11,r0,33
	daddi r10,r0,23
	daddi r13,r0,3
	jal lineaVertical

	daddi r11,r0,33
	daddi r10,r0,24
	daddi r13,r0,4
	jal lineaVertical

;PICO der

	daddi r11,r0,33
	daddi r10,r0,25
	daddi r13,r0,4
	jal lineaVertical

	daddi r11,r0,33
	daddi r10,r0,26
	daddi r13,r0,3
	jal lineaVertical
	
	daddi r11,r0,33
	daddi r10,r0,27
	daddi r13,r0,2
	jal lineaVertical

	daddi r11,r0,33
	daddi r10,r0,28
	daddi r13,r0,1
	jal lineaVertical

;pie izquierdo

 	daddi r10,r0,21
	daddi r11,r0,11
	daddi r13,r0,4
	jal lineaVertical

	daddi r10,r0,20
	daddi r11,r0,12
	daddi r13,r0,5
	jal lineaVertical

	daddi r10,r0,19
	daddi r11,r0,13
	daddi r13,r0,6
	jal lineaVertical

	daddi r10,r0,18
	daddi r11,r0,14
	daddi r13,r0,7
	jal lineaVertical
	
	daddi r19,r0,17
	daddi r18,r0,5
	
paint:	dadd r10,r0,r19
	daddi r11,r0,14
	daddi r13,r0,7
	daddi r18,r18,-1
	jal lineaVertical
	daddi r19,r19,-1
	bnez r18,paint

	daddi r10,r0,12
	daddi r11,r0,14
	daddi r13,r0,7
	jal lineaVertical

	daddi r10,r0,11
	daddi r11,r0,13
	daddi r13,r0,6
	jal lineaVertical	

;pie derecho

	daddi r10,r0,28
	daddi r11,r0,11
	daddi r13,r0,4
	jal lineaVertical

	daddi r10,r0,29
	daddi r11,r0,12
	daddi r13,r0,5
	jal lineaVertical

	daddi r10,r0,30
	daddi r11,r0,13
	daddi r13,r0,6
	jal lineaVertical

	daddi r10,r0,31
	daddi r11,r0,14
	daddi r13,r0,7
	jal lineaVertical

	daddi r19,r0,32
	daddi r18,r0,5
	
paint2:	dadd r10,r0,r19
	daddi r11,r0,14
	daddi r13,r0,7
	daddi r18,r18,-1
	jal lineaVertical
	daddi r19,r19,1
	bnez r18,paint2

	daddi r10,r0,37
	daddi r11,r0,14
	daddi r13,r0,7
	jal lineaVertical

	daddi r10,r0,38
	daddi r11,r0,13
	daddi r13,r0,6
	jal lineaVertical

	j fin

; LINEA VERTICAL: recibe como parametros: r10(x),r11(y),r13(pixels a pintar)
; el color ya está cargado 
; PINTA DE ARRIBA HACIA ABAJO

lineaVertical:
	dadd r30,r0,r11
	sb r10, 5(r24) 		; DATA+5 recibe el valor de coordenada X     	
salto:	sb r11, 4(r24) 		; DATA+4 recibe el valor de coordenada Y	
	daddi r11,r11,-1	
	lwu r25, CONTROL(r0) 	; r25 = dirección de CONTROL
	daddi r2, r0, 5 	; r2 = 5, función 5 = salida gráfica
	daddi r13,r13,-1
	sd r2, 0(r25) 		; CONTROL recibe 5 y produce el dibujo del punto
	bne r13,r0,salto
	dadd r11,r0,r30
	jr r31

dibujar:	
	dadd r29,r0,r31	
	daddi r11,r11,-1
        dadd r10,r10,r17
	jal lineaVertical
	jr r29
                
fin: 	halt