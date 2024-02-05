org 100h
.model small
.stack 100h
.data 

.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov cx,26        
    mov dx,65        
    
    l1:
    mov ah,2
    int 21h
    mov bx,dx        
    
    mov ah,2
    mov dx,32        
    int 21h
    
    mov dx,bx
    inc dx           
    loop l1
    
    
    main endp
end main