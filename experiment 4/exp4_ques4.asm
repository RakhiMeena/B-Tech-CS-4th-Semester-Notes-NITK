.MODEL SMALL
.DATA                      
A DW "ENTER BINARY NO.: $"
B DW "HEX NO.: $"
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV AH,09H
LEA DX,A
INT 21H
MOV BL,0
MOV CL,16
MOV DL,16
L:
DEC DL
MOV DH,CL
MOV CL,DL
MOV AH,01H
INT 21H 
MOV AH,0
SUB AL,30H
SHL AX,CL
ADD BX,AX
MOV CL,DH
LOOP L
MOV AH,02H
MOV DL,10
INT 21H
MOV DL,13
INT 21H
MOV AH,09H
LEA DX,B
INT 21H 
MOV AH,02H
MOV DL,BH
SHR DL,4 
CMP DL,10
JGE S1
ADD DL,30H 
INT 21H
JMP R
S1:
ADD DL,37H
INT 21H
R:
MOV DL,BH
SHL DL,4
SHR DL,4
CMP DL,10
JGE S2
ADD DL,30H
INT 21H
JMP Q
S2:
ADD DL,37H
INT 21H
Q: 
MOV DL,BL
SHR DL,4 
CMP DL,10
JGE S3
ADD DL,30H 
INT 21H
JMP V
S3:
ADD DL,37H
INT 21H
V:
MOV DL,BL
SHL DL,4
SHR DL,4
CMP DL,10
JGE S4
ADD DL,30H
INT 21H
JMP T
S4:
ADD DL,37H
INT 21H
T:
MOV DL,'H'
INT 21H
END START
