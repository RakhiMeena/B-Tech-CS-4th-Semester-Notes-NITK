data segment 
    even db "Even Number $"
    odd db "Odd Number $"
data ends
code segment
    assume cs:code,ds:data
    begin:
     mov ax,data
     mov ds,ax
     
     mov ah,1
     int 21h
     
     mov bl,2
     div bl
     
     cmp ah,0
     je evennumber
     
     mov ah,10
     mov ah,2
     int 21h
     
     mov ah,13
     mov ah,2
     int 21h
     
     mov dx,offset odd
     mov ah,9
     int 21h
     
     mov ah,4ch
     int 21h
     
     evennumber:
     
     mov ah,10
     mov ah,2
     int 21h
     mov ah,13
     mov ah,2
     int 21h
     
     mov dx,offset even
     mov ah,9
     int 21h
     
     mov ah,4ch
     int 21h
     
     code ends
end begin
     
      
    