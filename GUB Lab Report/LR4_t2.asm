org 100h
.stack 1000
.model small
.data
    n db ?             
    result dw 1        
    msg1 db "Enter the number: $"
    next db 10, 13, "$"

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
    mov dx,ax              
    loop Label1
   
    mov ah,2
    int 21h

main endp

end main
