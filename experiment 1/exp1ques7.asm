.model small
.code
start:
mov cl, 13
mov dl, 65
l: mov ah, 02h
int 21h
inc dl
add dl, 32
mov ah, 02h
int 21h
sub dl, 32
inc dl
loop l
end start