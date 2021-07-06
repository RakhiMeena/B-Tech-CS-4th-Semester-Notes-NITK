.model small
.data
a db "NITKKR$"
.code
start:

mov ax, @data
mov ds, ax
mov si, offset a
mov di, si
l: mov dl, [si]
   inc si
   cmp [si], '$'
   jnz l
n: dec si
   mov dl, [si]
   mov ah, 02h
   int 21h
   cmp si, di
   jnz n
end start