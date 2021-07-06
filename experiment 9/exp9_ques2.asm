.model small
.data

msg3 db 10,13, "$"



.code
start:

    mov ax,@data
    mov ds,ax
    
    mov ch,00h 
    
    mov ah,01h
    int 21h
    sub al,30h
    mov ah,00h
    mov cx,ax
    mov bx,cx
    mov si,2000h
    mov bx,cx
    mov di,4000h
    mov [di],bx
    mov ah,09h
    lea dx,msg3
    int 21h
    
    input:
        mov ah,01h
        int 21h
        mov ah,00h
        mov [si],ax
        inc si
        inc si
    loop input
    mov cx,0000h
    sort:
        mov si,2000h
        mov cx,bx
        sub cx,01h
        inner:
            mov ax,[si]
            mov dx,[si+2]
            cmp ax,dx
            jc s
            mov [si+2],ax
            mov [si],dx  
            s:
            inc si
            inc si
        loop inner  
        dec bx
        cmp bx,0001h
        jne sort 
        
    mov ah,09h
    lea dx,msg3
    int 21h
        
    e:
    mov si,2000h
    mov cx,[di]
    print:
        mov dx,[si]
        mov ah,02h
        int 21h
        inc si
        inc si
    loop print:
    
end start:    
    