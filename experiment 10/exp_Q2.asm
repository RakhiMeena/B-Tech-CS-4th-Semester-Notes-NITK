	.model small
	
	
	.data
	
	.code
	start:
	
	mov ax,@data
	mov ds,ax
	
	
	mov al, 13h
	mov ah, 0
	int 10h     ; set graphics video mode. 
	mov al, 1100b 
	 
	mov cx, 0 
    mov dx, 20	
    
	print: 	
	mov ah, 0ch
	int 10h
	add cx,1 
	jmp print
    
	
	