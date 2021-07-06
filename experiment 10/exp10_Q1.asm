.model small

.data
A DB 10,13,"Enter the x co-ordinate $ "
B DB 10,13,"Enter the y co-ordinate $ "   
C DB 10,13,"The cursor position is changed $ "
    

.code

start:

  MOV AX,data
  MOV DS,AX
         
  mov dx,offset A
  mov ah,09h
  int 21h       
         
  mov ah,01h
  int 21h
  sub al,30h
  mov dl,al   
  
  
  mov dx,offset B
  mov ah,09h
  int 21h       
         
  mov ah,01h
  int 21h
  sub al,30h
  mov dh,al
  
       
       
  mov ah,02H  
  mov bh,00      
  int 10h

  mov dx,offset C
  mov ah,09h
  int 21h  
  
  end start