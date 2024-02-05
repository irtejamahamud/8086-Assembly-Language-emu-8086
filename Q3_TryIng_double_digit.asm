showmsg macro txt  
    mov dx,offset txt
    mov ah,9
    int 21h
endm


input_double_digit macro num 
    mov num ,0
    mov bl,10
    
    input:
    mov ah,1
    int 21h
    cmp al,13         
    je next
    
    sub al,48          
    mov ah,0           
    
    mov cx,ax          
    mov ax,num                                  
                                                   
    mul bl                             
    add ax,cx          
    mov num,ax          
    jmp input
    
    next:
    
endm

output_double_digit macro num 
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




org 100h
.model small
.stack 100h

.data
msg db "Enter a number: $"
num dw ?  
size dw ? 
a dw 20 dup(?)

msg2 db 13,10,"Number is: $" 
msg3 db 13,10,"Array Size: $" 
msg4 db 13,10,"Array input:"
newline db 10,13,"$"


.code
main proc 
    mov ax,@data
    mov ds,ax   
    
    showmsg msg3
    input_double_digit size
    
    mov cx,size
    mov si,offset a
    
    input1:
    showmsg newline
    input_double_digit num
    mov bx,num
    mov [si],bx
    inc si
    loop input1 
    
    showmsg msg2
    output:
    showmsg newline
    mov bx,[si]
    mov num,bx
    output_double_digit num
    inc si
    loop output
    
    
 main endp
end main
