.MODEL SMALL
.DATA
A DB "ENTER FIRST NO.:-    $"	
B DB "ENTER SECOND NO.:-   $"
C DB "QUOTIENT=            $"
.CODE
START:
MOV AX,@DATA
MOV DS,AX
LEA DX,A
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV BL,AL
SUB BL,30H
MOV DL,10
MOV AH,02H
INT 21H
MOV DL,13
MOV AH,02H
INT 21H  
LEA DX,B
MOV AH,09H
INT 21H
MOV AH,01
INT 21H 
SUB AL,30H 
MOV BH,AL
MOV AL,BL
MOV BL,BH
MOV AH,00H
DIV BL 
AAD
MOV BX,AX
ADD BX,3030H
MOV DL,10
MOV AH,02H
INT 21H
MOV DL,13
MOV AH,02H
INT 21H
LEA DX,C
MOV AH,09H
INT 21H
MOV DL,BH
MOV AH,02H
INT 21H
MOV DL,BL
MOV AH,02H
INT 21H
END START



