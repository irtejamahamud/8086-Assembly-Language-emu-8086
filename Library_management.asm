showmsg macro txt  
    mov ah,9
    lea dx,txt
    int 21h
endm

doubledigit_print macro num
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
    
endm  

doubledigit_print2 macro num
    mov ax,num
    mov cx,0
    mov bl,10
    mov dx,0
    
    l11:
    div bx
    push dx
    mov dx,0
    mov ah,0
    inc cx
    cmp ax,0
    jne l11
    mov ah,2
    
    l22:
    pop dx
    add dx,48
    int 21h
    loop l22
    
endm


org 100h
.model small
.stack 100h
.data

msg dw 10,13,"Number of Books In The Library :$"
msg1 dw 10,13,"How many books you want to checkout: $"
msg2 dw 10,13,"How many books do you want to return: $"  
msg4 dw 10,13,"Enter the number of books in the library:$" 
msg5 dw 10,13,"Do you want to continue(y/n): $"


books dw ?
checkout dw ?
return dw ?

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    showmsg msg4 
    mov books ,0
    mov bl,10
    
    input:
    mov ah,1
    int 21h
    cmp al,13           
    je next
    
    sub al,48          
    mov ah,0               
    
    mov cx,ax           
    mov ax,books                             
                                                   
    mul bl                               
    add ax,cx           
    mov books,ax          
    jmp input
    
    next: 
    showmsg msg  
    doubledigit_print books
    
    showmsg msg1
    mov ah,1
    int 21h
    sub al,48
    mov bx,0
    mov bl,al
    ;mov checkout,bx 
    mov ax,books
    sub ax,bx
    
    mov books,ax
    
    
    showmsg msg2
    mov ah,1
    int 21h
    sub al,48
    
    mov bx,0
    mov bl,al 
    mov ax,books
    add ax,bx
    
    mov books,ax 
    
    showmsg msg  
    doubledigit_print2 books 
    
    showmsg  msg5
    mov ah,1
    int 21h
    
    cmp al, 'n'
    je exit_program  
    
    jmp next
    
    exit_program:

    mov ah, 4Ch
    int 21h
    

    main endp
end main