org 100h
.model small
.stack 100h
.data 

.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov cx,26        ;26 later
    mov dx,65        ;ascii code of A
    
    l1:
    mov ah,2
    int 21h
    mov bx,dx        ;storing the value of dx to print space
    
    mov ah,2
    mov dx,32        ;printing space
    int 21h
    
    mov dx,bx
    inc dx           ;increamenting the ascii code
    loop l1
    
    
    main endp
end main