org 100h
.model small
.stack 100h
.data
msg db "Enter a number: $"
num dw ?
msg2 db 13,10,"Number is: $"

.code
main proc 
    mov ax,@data
    mov ds,ax   
    
    mov dx, offset msg
    mov ah,9
    int 21h
    
    mov num ,0
    mov bl,10
    
    input:
    mov ah,1
    int 21h
    cmp al,13           ;check enter             | 2
    je next
    
    sub al,48           ;ascii to number         | 2
    mov ah,0            ;for no garbage value    
    
    mov cx,ax           ;input into cx           ;cx<-2 
    mov ax,num                                   ;ax<-0 
                                                   
    mul bl              ;                        0*10=0                 
    add ax,cx           ;                        0+2=2
    mov num,ax          ;                        num=2
    jmp input
    
    next:
    mov dx, offset msg2
    mov ah,9
    int 21h 
    
    mov ax,num
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
