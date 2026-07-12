ORG 1000h
TABLA DB 1,2,3,4,5
RESULT DB 0

ORG 2000h
mov AX, 0h
MOV AH, OFFSET RESULT - offset TABLA	           
MOV BX, OFFSET TABLA
for: add AL, [bx]
inc bX
dec AH
jnz for
MOV RESULT, AL
HLT 
END
