.model small
.code
start:
mov cl, 26
mov dl, 65

l: mov ah, 02h
int 21h
add dl, 32
mov ah, 02h
int 21h
sub dl, 32
inc dl
loop l
end start