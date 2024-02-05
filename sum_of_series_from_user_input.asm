org 100h
.model small
.stack 100h
.data
n dw ? 
sum dw ?
msg2 db 10,13, "Sum: $" 
msg db "Input: $"

.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    mov dx,offset msg
    int 21h
    
    mov n,0
    mov bx,10 
    input:
    mov ah,1
    int 21h
    cmp al,13
    je next
    sub al,48
    mov ah,0
    mov cx,ax
    mov ax, n
    mul bx
    add ax,cx
    mov n,ax
    jmp input
    
    
    next:
    mov cx,n        
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