.MODEL SMALL
.DATA
a DB "Enter Number : $"
b DB "Number is Positive $"
c DB "Number is Negative $"
.CODE                                       
START:
MOV AX,@DATA
MOV DS,AX
LEA DX,a                                          
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
CMP AL,45
JE N
MOV BL,0
JMP Q
N:
MOV BL,1
Q:
INT 21H 
MOV AH,02H
MOV DL,10
INT 21H
MOV DL,13
INT 21H
CMP BL,0
JE P
LEA DX,c
JMP R
P:
LEA DX,b
R:
MOV AH,09H
INT 21H
END START
