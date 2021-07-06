.model small
.data
a db 10,13, "Enter a nubmer:  $"
b db 10,13,"Factorial is:  $"
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
     
;factorial
mov al,bl
mov cl,al
dec cl

mov bh,00h 
cmp bh,al
jz zero
cmp bh,cl
jz zero
          
again:
    mul cl
    dec cl
    jnz again
aam
mov ch,al
add ch,30h

mov al,ah
aam
mov bx,ax
add bx,3030h

mov dl,bh
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h 

mov dl,ch
mov ah,02h
int 21h 

jmp last

zero:mov dl,31h
    mov ah,02h
    int 21h   
       
last:
    end start