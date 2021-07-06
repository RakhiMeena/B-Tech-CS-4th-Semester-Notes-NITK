.model small
.data
a dw "NITKKR$"
.code
start:
mov ax, @data
mov ds, ax
mov si, offset a
l: mov dx, [si]
   mov ah, 02h
   int 21h
   inc si
   cmp [si], '$'
   jnz l
end start