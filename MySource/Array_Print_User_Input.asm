org 100h
.stack 1000
.model small
.data 


      a db 20 dup(?) 
      b db ?
      msg db 10,13,"Enter The Array : $"
      msg1 db 10,13,"Array Elements : $"
      msg2 db "Enter The Array Size: $"
      
.code

main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx, msg2
    int 21h
    
    mov ah,1
    int 21h
    mov b,al
    sub b,48
    
    mov cx,0000h
    mov cl, b 
    mov si ,0
    
    mov ah,9
    lea dx, msg
    int 21h
    
initialize: 
       mov ah,1
       int 21h
       mov a[si],al        ;initailize
       
       mov ah,2
       mov dl,32
       int 21h
       
       inc si
    loop initialize 
    
    mov cx,0000h
    mov cl, b 
    mov si ,0 
    
    mov ah,9
    lea dx, msg1
    int 21h
     
print:
    mov ah,2
    mov dl,a[si]
    int 21h
    inc si  
    
    mov ah,02
    mov dl,032
    int 21h
    
    loop print           
               

main endp
end main
