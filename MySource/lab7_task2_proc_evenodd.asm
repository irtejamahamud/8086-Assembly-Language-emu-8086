org 100h
.stack 100h
.model small
.data
      a db ?  
      msg db 10,13,"Enter A Number :$"
      odd db 10,13,"Odd $" 
      even db 10,13,"Even $"
      
.code

main proc  

      mov ax,@data
      mov ds,ax    
      
     ; call input
main endp 

input proc 
    mov ah ,9
    lea dx,msg
    int 21h
    
    mov ah,01
    int 21h
    
    mov a,al
    
   call evenodd
    ret
  input endp

evenodd proc
    
   mov bl,a
   
   mov bl,2
   div bl 
   mov al,ah 
   
   cmp al,0 
   je l1
   
   mov ah ,9
   lea dx,odd
   int 21h 
   
   ret
   
   l1:
    mov ah ,9
    lea dx,even
    int 21h
   
    evenodd endp
end main
