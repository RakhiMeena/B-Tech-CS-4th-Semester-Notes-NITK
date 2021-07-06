;program to covert gray code into binary code.(8-bit)
.model small
.data
a db "enter the graycode of 8-bit number :$"
b db "binary number :$"
.code
start:
mov ax,@data
mov ds,ax
mov dx,offset a
mov ah,09h
int 21h
mov cl,08h 
mov bl,0h
l:
mov ah,01h
int 21h
sub al,30h
shl bl,01h
xor bl,al
dec cl
cmp cl,0h
jnz l
mov dl,13
mov ah,02h
int 21h  
mov dl,10
mov ah,02h
int 21h
mov dx,offset b
mov ah,09h
int 21h
mov di,08h
p:
mov bh,0h
shl bx,01h 
xor cl,bh
mov ch,cl
add ch,30h
mov dl,ch
mov ah,02h
int 21h
dec di
cmp di,0h
jnz p


end start
 