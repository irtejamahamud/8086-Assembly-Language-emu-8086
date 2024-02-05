org 100h
.stack 1000
.model small
.data
    n db ?             
    result dw 1        
    msg1 db "Enter the number: $" 
    msg2 db 10,13,"Factorial : $"
    next db 10, 13, "$" 
    fact dw ?

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09
    lea dx, msg1
    int 21h            

    mov ah, 01
    int 21h             

    sub al, 48          

    mov cl, al          

    mov ax, 1            

Label1:
    mul cx 
   ;mov dx,ax              
    loop Label1
    mov fact,ax
    
    mov dx, offset msg2
    mov ah,9
    int 21h 
    
    mov ax,fact
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
