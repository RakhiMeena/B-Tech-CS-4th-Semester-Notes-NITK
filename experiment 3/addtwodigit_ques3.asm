.model small
.data
a db 10,13, "Enter a$"
b db 10,13, "Enter b$"
c db 10,13, "Result is$"
.code
start:

mov ax,@data
mov ds,ax

;first digit packed in bh

mov dx,offset a
mov ah,09h
int 21h

mov ah,01h
int 21h 
sub al,30h
mov bh,al

mov ah,01h
int 21h  
sub al,30h
mov bl,al

mov ax,bx
aad
mov bh,al

;second digit packed in bl
     
mov dx,offset b
mov ah,09h
int 21h 

mov ah,01h
int 21h
sub al,30h
mov ch,al

mov al,01h
int 21h 
sub al,30h
mov cl,al

mov ax,cx
aad
mov bl,al

;add bl and bh

add bl,bh
mov al,bl
aam
mov bx,ax
add bl,30h

mov cl,bh
mov al,cl
aam
mov cx,ax
add cx,3030h
        

;print

mov dx,offset c      
mov ah,09h
int 21h 

mov dl,ch
mov ah,02h
int 21h

mov dl,cl
mov ah,02h
int 21h 

mov dl,bl
mov ah,02h
int 21h
                 
end start
