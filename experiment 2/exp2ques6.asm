.model small
.data
a dw "NITKKR$"
.code
start:

mov ax, @data
mov ds, ax
mov si, offset a
mov di, si
l: mov dx, [si]
   inc si
   cmp [si], '$'
   jnz l
n: dec si
   mov dx, [si]
   mov ah, 02h
   int 21h
   cmp si, di
   jnz n
end start