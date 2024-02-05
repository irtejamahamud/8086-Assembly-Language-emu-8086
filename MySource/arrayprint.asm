space macro
    mov ah,2
    mov dl,032
    int 21h   
endm

msg_print macro msg
    mov ah,9
    lea dx,msg
    int 21h
endm

org 100h
.stack 1000
.model small
.data
      a db 10 dup(?) 
      msg db "Enter The Array: $" 
      msg1 db 10,13,"Array Elements: $"
      
.code

main proc  
    mov ax,@data
    mov ds,ax
    
    mov cx, 10 
    mov si ,0 
    
    msg_print msg

initialize:  
       mov ah,1
       int 21h
       mov a[si],al
                
       space
       inc si
    loop initialize

    mov cx, 10 
    mov si ,10
    
    msg_print msg1
     
print:
    mov ah,2
    mov dl,a[si]
    int 21h
    dec si  
    
    space
    
    cmp si,0
    je end_program 
    
    jmp print
    
    
    end_program:
    mov ah,4ch    
    int 21h
    

main endp
end main
