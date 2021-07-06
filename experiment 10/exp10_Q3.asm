.model small
.data
.code
start:
	
	mov ax,@data
	mov ds,ax
	
	
	mov al, 13h
	mov ah, 0
	int 10h         ; set graphics video mode. 
	mov al, 1100b   ;setting colour of pixel
	 
	mov cx, 10    ;setting column if pixel
    mov dx, 20	 ;setting row of pixel
	mov ah, 0ch
	int 10h 

end start




