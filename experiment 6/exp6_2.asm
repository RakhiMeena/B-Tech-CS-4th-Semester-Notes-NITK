; program to covert binary code into gray code.(16-bit)
.model small
.data
 a db "enter 16-bit binary number:$"
 b db "gray code:$"
.code
start:
mov ax,@data
mov ds,ax
mov dx,offset a
mov ah,09h
int 21h
mov cl,010h
l:
mov ah,01h
int 21h
shl bx,01h
sub al,30h
mov ah,0h 
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
 
mov cl,bh
mov si,cx
mov cl,bl
mov di,cx

mov cx,0h
mov bx,0h
mov bl,08h 
mov dx,0h
p:
mov ax,si
shl ax,01h
mov ch,cl
xor ch,ah
mov cl,ah
shl dx,01h
xor dl,ch
dec bl
mov ah,0h
mov si,ax
cmp bl,0h
jnz p 

;mov cx,0h
mov bx,0h
mov bl,08h
q:
mov ax,di
shl ax,01h
mov ch,cl
xor ch,ah
mov cl,ah
shl dx,01h
xor dl,ch
dec bl
mov ah,0h
mov di,ax
cmp bl,0h
jnz q

mov bl,dh
mov cl,dl
mov dx,0h
mov ax,0h 
mov bh,08h
r:
mov al,bl
shl ax,01h
add ah,30h
mov bl,al
mov dl,ah
mov ah,02h
int 21h 
mov ah,0h
dec bh
cmp bh,0h
jnz r
mov bh,08h 
n:
mov al,cl
shl ax,01h
add ah,30h
mov cl,al
mov dl,ah
mov ah,02h
int 21h
mov ah,0h
dec bh
cmp bh,0h
jnz n
 

end start 