.model small
.stack 100h
.data 
a db 10,13, "enter gray number : $"
b db 10,13, "Binary nummber : $"

.code
start:
mov ax,@data
mov ds,ax
mov dx,offset a 
;code to take 8 digit input
mov ah,09h
int 21h
mov bl,0
mov cl,8
mov dl,8

l1:
dec dl 
mov dh,cl
mov cl,dl
mov ah,01h
int 21h
sub al,30h
shl al,cl
add bl,al
mov cl,dh
loop l1                    

;
mov ah,09h
mov dx,offset b
int 21h
mov al,bl
shr al,1
xor al,bl
mov bl,al
mov cl,8
mov ah,02h

l2:
shl bl,1  ;shift to left and MSB->CF and LSB->0
jc p1  ;if carry flag is 1 then it run/execute
mov dl,30h
int 21h
jmp lh
p1:
mov dl,31h
int 21h
lh:
loop l2

end start
