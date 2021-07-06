.model small
.code
start:
mov cl, 10
mov dl, 48
l: mov ah, 02h
int 21h
inc dl
loop l
end start