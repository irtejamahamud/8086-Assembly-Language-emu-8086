org 100h
.model small
.stack 100h
.data 
msg dw 10,13,"Enter The First Character: $"
msg1 dw 10,13,"Enter The Second Character: $" 
msg2 dw 10,13,"Characters Are: $"


.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov dx,offset msg
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov dx,offset msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 
    
    cmp bl,bh         ; bl<=bh  alphabetic order
    jae l1            ; jbe bl>=bh reverse alphabetic order
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    ret 
    
    l1:
    mov dx,offset msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
        
    ret
    main endp
end main