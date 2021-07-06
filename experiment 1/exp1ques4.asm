.model small
.code
start:
mov cl, 128
mov dl, 0
l: mov ah, 02h
int 21h
inc dl

loop l
end start