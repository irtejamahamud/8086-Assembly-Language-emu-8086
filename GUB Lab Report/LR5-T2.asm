
msgprint macro msg
    mov ah,9
    lea dx, msg
    int 21h        
  endm

org 100h
.stack 1000
.model small
.data 
      a db 20 dup(?) 
      b db ?
      msg db 10,13,"Enter The Array : $"
      msg1 db 10,13,"Array Elements : $"
      msg2 db "Enter The Array Size : $"      
.code

main proc  
    mov ax,@data
    mov ds,ax
    
    msgprint msg2
    
    mov ah,1
    int 21h
    mov b,al
    sub b,48
    
    mov cx,0000h
    mov cl, b 
    mov si ,0
    
   msgprint msg
    
initialize: 
       mov ah,1
       int 21h
       mov a[si],al       
       
       mov ah,2
       mov dl,32
       int 21h
       
       inc si
    loop initialize 
    
    mov cx,0000h
    mov cl, b 
    mov si ,0 
    
    msgprint msg1
                    
print:
    mov ah,2
    mov dl,a[si]
    int 21h
    inc si  
    
    mov ah,02
    mov dl,032
    int 21h
    
    mov bx,0000h
    mov bl,b
    cmp si,bx
    je end_program 
    
    jmp print
    
    
    end_program:
    mov ah,4ch    
    int 21h        

main endp
end main
