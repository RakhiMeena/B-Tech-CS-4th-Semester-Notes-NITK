.model small 

.code 
start:

mov cl, 26
mov dl, 65

l: mov ah, 02h
int 21h
inc dl
loop l

end start