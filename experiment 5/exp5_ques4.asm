.MODEL SMALL
.DATA
a DB "Enter number : $"
b DB "Number is odd $"
c DB "Number is even $"
.CODE                                         
START:
MOV AX,@DATA
MOV DS,AX
LEA DX,a
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H 
INT 21H
INT 21H
INT 21H
INT 21H
SUB AL,30H
SHL AL,7
SHR AL,7
CMP AL,1
JE N
MOV BL,0
JMP Q
N:
MOV BL,1
Q:
MOV AH,02H
MOV DL,10
INT 21H
MOV DL,13
INT 21H
CMP BL,0
JE P
LEA DX,b
JMP R
P:
LEA DX,c
R:
MOV AH,09H
INT 21H
END START
