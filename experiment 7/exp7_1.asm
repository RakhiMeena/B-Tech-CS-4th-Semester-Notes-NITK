;a program to find the factorial of a given number
.model small
.data 
a db "enter a number :$"
b db "factorial is :$"
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
mov dl,10
mov ah,02h
int 21h
mov dl,13
mov ah,02h
int 21h
mov dx,offset b
mov ah,09h
int 21h
mov al,01h
mov cl,bl
p:
mul cl
dec cl
cmp cl,01h
jge p 
mov ah,0h
aam 
add al,30h
mov bh,al
mov al,ah
aam
add ax,3030h
mov bl,al
mov al,ah
mov dl,al
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov dl,bh
mov ah,02h
int 21h


 
end start