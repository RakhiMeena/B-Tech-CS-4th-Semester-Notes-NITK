.model small
.data
a db "asb$"
b db "PALINDROME$"
c db "NOT A PALINDROME$"
.code
start:
mov ax, @data
mov ds, ax
mov si, offset a
mov di, offset a
l: inc di
   cmp [di], '$'
   jnz l
dec di   

mov al, [si]
cmp [di], al;
jnz o

n: dec di
   inc si
   cmp si, di 
   jge o
   mov al, [di]    
   cmp [si], al     
   jz n
   
o: cmp si, di
   jge p
   mov dl, offset c
   jnp r
   
p: mov dl, offset b

r: mov ah, 09h
   int 21h
   
end start
   