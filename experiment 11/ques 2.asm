.MODEL SMALL
.DATA
A DB "MOUSE IS INSTALLED!$"
B DB "MOUSE IS NOT INSTALLED!$"
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV AX,0
INT 33H
CMP AX,0
JE  N
LEA DX,A
JMP Q
N:
LEA DX,B
Q:
MOV AH,09H
INT 21H
END START