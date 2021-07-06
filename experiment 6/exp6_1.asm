.model small
.data
 a db "enter 8-bit binary number:$"
 b db "gray code:$"
.code
start:
mov ax,@data
mov ds,ax
mov dx,offset a
mov ah,09h
int 21h
mov cl,08h
l:
mov ah,01h
int 21h
shl bl,01h
sub al,30h 
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
 
p:
mov ah,0h
mov al,bl
shl ax,01h
mov bl,al
mov ch,cl
mov cl,ah
xor ch,cl
mov ah,02h
add ch,30h
mov dl,ch
int 21h
cmp bl,0h
jnz p

 

end start 