.model small
.data
a dw "asb$"
b dw "PALINDROME$"
c dw "NOT A PALINDROME$"
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

mov ax, [si]
cmp [di], ax;
jnz o

n: dec di
   inc si
   cmp si, di 
   jge o
   mov ax, [di]    
   cmp [si], ax     
   jz n
   
o: cmp si, di
   jge p
   mov dx, offset c
   jnp r
   
p: mov dx, offset b

r: mov ah, 09h
   int 21h
   
end start
   