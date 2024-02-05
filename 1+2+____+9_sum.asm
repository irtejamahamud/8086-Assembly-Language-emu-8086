org 100h
.model small
.stack 100h
.data 
sum dw ?
msg2 db "Sum: $"

.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov cx,9        
    xor bx,bx        
    
    lopp1:
    add bx,cx         ;1+2+.....+9=45
    loop lopp1 
    
    mov sum ,bx
;print two digit number----    
    mov dx, offset msg2
    mov ah,9
    int 21h 
    
    mov ax,sum
    mov cx,0
    mov bx,10
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