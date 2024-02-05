org 100h
.stack 100h
.model small
.data
      a db 10 dup(?)  
      msg db "Enter Two Number :$"
      b db 10,13,"Result $"
      
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
    
    mov bl,al
    
    mov ah,01
    int 21h
    
    mov bh,al
    call sum
    ret
    input endp

sum proc
    mov ah ,09
    lea dx,b
    int 21h
    
    add bl,bh
    sub bl,48
    
    mov ah,2
    mov dl,bl
    int 21h
    ret
    
    sum endp
end main
