.model small
.data
a db "National Institute of Technology$"

.code
start:
mov ax, @data
mov ds, ax
mov dl, offset a
mov ah, 09h
int 21h
end start