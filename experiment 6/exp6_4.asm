;program to covert binary code into gray code.(16-bit)
.model small
.data
a db "enter the graycode of 16-bit number :$"
b db "binary number :$"
.code
start:
mov ax,@data
mov ds,ax
mov dx,offset a
mov ah,09h
int 21h
mov cl,10h 
mov bl,0h
l:
mov ah,01h
int 21h
sub al,30h
mov ah,0h
shl bx,01h
xor bx,ax
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


mov di,10h
p:
mov bh,0h
shl bx,01h 
;mov ch,cl
xor cl,bh
;shl cl,01h
;xor cl,ch
mov ch,cl
add ch,30h
mov ah,0h
mov al,ch
shl si,01h
xor si,ax
dec di
cmp di,0h
jnz p


end start
 