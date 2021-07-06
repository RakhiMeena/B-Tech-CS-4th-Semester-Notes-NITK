.model small
.data
a db "Fibonaacci Series is $"  
.code
start:
       
mov ax,@data
mov ds,ax

mov dx,offset a
mov ah,09h
int 21h

mov bl,0
mov al,bl
    aam
    mov ch,al
    add ch,30h

    mov al,ah
    aam 
    mov dh,al
    mov cl,ah
    add dh,30h
    add cl,30h

    mov dl,cl
    mov ah,02h
    int 21h

    mov dl,dh
    mov ah,02h
    int 21h 

    mov dl,ch
    mov ah,02h
    int 21h
   

   
mov bh,1     
mov al,bh
    aam
    mov ch,al
    add ch,30h

    mov al,ah
    aam 
    mov dh,al
    mov cl,ah
    add dh,30h
    add cl,30h

    mov dl,cl
    mov ah,02h
    int 21h

    mov dl,dh
    mov ah,02h
    int 21h 

    mov dl,ch
    mov ah,02h
    int 21h
   
 
   
loop:add bl,bh  
   
    mov al,bl
    aam
    mov ch,al
    add ch,30h

    mov al,ah
    aam 
    mov dh,al
    mov cl,ah
    add dh,30h
    add cl,30h

    mov dl,cl
    mov ah,02h
    int 21h

    mov dl,dh
    mov ah,02h
    int 21h 

    mov dl,ch
    mov ah,02h
    int 21h
   
 

    mov cl,bh
    mov bh,bl
    mov bl,cl
   
    cmp bh,233
    jnz loop      

end start 
