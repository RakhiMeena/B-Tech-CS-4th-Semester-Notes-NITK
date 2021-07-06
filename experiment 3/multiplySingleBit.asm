.model small  
.stack 100h
.data
msg1 db 10,13, 'Enter First Number: $'
msg2 db 10,13, 'Enter Second Number: $'
msg3 db 10,13, 'Product : $'

.code
main proc
     
    mov ax,@data
    mov ds,ax
    mov dx,offset msg1
    mov ah,9
    int 21h 
    mov ah,01h
    int 21h
    
    mov bl,al
    sub bl,48
    
   
    
   
    mov dx,offset msg2
    mov ah,9
    int 21h 
    
    mov ah,01h
    int 21h
    sub al,48
    mul bl
    
    mov bl,al
    sub bl,48  
      
    
    mov dx,offset msg3
    mov ah,9
    int 21h 
     
    mov dl,bl 
    mov ah,02h
    int 21h 
      

main endp
end main