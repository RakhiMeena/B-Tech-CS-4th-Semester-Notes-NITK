.model small
.data
a db 10,13,"Enter binary number :  $"
b db 10,13,"Gray number :  $"

.code
start:
mov ax,@data
mov ds,ax
mov dx ,offset a
mov ah,09h
int 21h
mov bl,0
mov cl,8
mov dl,8

l1:
dec dl
mov dh,cl
mov cl,dl
mov ah,01h
int 21h
sub al,30h
shl al,cl
add bl,al
mov cl,dh

loop l1
mov ah,09h
mov dx ,offset b
int 21h
mov al,bl
shr al,1
xor al,bl
mov bl,al
mov cl,8
mov ah,02h
l2:
shl bl,1
jc p1
mov dl,30h
int 21h
jmp lh
p1:
mov dl,31h
int 21h
lh:
loop l2
end start

