.MODEL SMALL
.DATA
a DB "ENTER FIRST NO.     $"
b DB "ENTER SECOND NO.    $"
C DB "PRODUCT=            $"
.CODE
START:
MOV AX,@DATA
MOV DS,AX
LEA DX,a
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV BL,AL
MOV AH,02H
MOV DL,10
INT 21H
MOV DL,13
INT 21H
LEA DX,b
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
SUB AL,30H
MOV AH,0
MUL BL
AAM
MOV BX,AX
ADD BX,3030H 
MOV AH,02H
MOV DL,10
INT 21H
MOV DL,13
INT 21H
LEA DX,c
MOV AH,09H
INT 21H 
MOV AH,02H
MOV DL,BH
INT 21H
MOV DL,BL
INT 21H
END START