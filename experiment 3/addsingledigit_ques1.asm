.model small
.data
a db "Enter a$"
b db "Enter b$"
c db "Result is $"
.code
start:       

mov ax,@data
mov ds,ax

mov dx,offset a
mov ah,09h
int 21h

mov ah,01h
int 21h

sub al,30h
mov bl,al

mov dx,offset b
mov ah,09h
int 21h

mov ah,01h
int 21h

sub al,30h
mov bh,al

add bl,bh
mov al,bl
mov ah,00h
aaa      

mov bx,ax
add bx,3030h

mov dx,offset c
mov ah,09h
int 21h  

mov dl,bh
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h

end start
