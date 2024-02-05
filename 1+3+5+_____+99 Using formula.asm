org 100h
.model small
.stack 100h
.data 
a1 db 1
an db 99 
d db 2
n db ? 

sum dw ?

msg dw "SUM : $"


.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov bl, a1
    mov bh, an 
    
    sub bh,bl
    mov al,bh
    
    mov bl,2
    add bl,1
    div bl
    
    mov n,al          ; n ber hoisse
    
    mov bl,2
    div bl            ;res in al
    
    mov bl, a1
    mov bh, an 
    
    add bh,bl 
    mul bh
   
    
    mov sum ,ax 
    
    mov dx, offset msg
    mov ah,9
    int 21h 
    
    mov ax,sum
    mov cx,0
    mov bl,10
    mov dx,0
    
    l1:
    div bx
    push dx
    mov dx,0
    mov ah,0
    inc cx
    cmp ax,0
    jne l1
    mov ah,2
    
    l2:
    pop dx
    add dx,48
    int 21h
    loop l2
    
    ret
    
    
    
    main endp
end main
