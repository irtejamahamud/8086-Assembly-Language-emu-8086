;Question: Enter the last two digit of your id and if the sum of those two number is even the subtract 1
;and if the sum of those number is odd then add 1
org 100h
.model small
.stack 100h
.data 
msg dw 10,13,"Enter Last Two Digit of Your ID: $" 
oddm dw 10,13,"Odd Number $" 
evenm dw 10,13,"Even Number $"
num1 db ?
num2 db ?

.code
main proc 
    mov ah,9
    lea dx,msg 
    int 21h
    
    mov ah ,1
    int 21h    
    sub al,48
    mov num1,al
    
    mov ah,1
    int 21h
    sub al,48
    mov num2 , al 
    
    mov bl,num1
    mov bh,num2
    add bl,bh
    mov al,bl 
    
    mov bh,2 
    div bh               ;number is divide/2
    cmp ah,0             ;reminder in ah
    je even 
    
    mov ah,9
    lea dx,oddm
    int 21h 
    
    add bl,1
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    ret
    
    even:
    mov ah,9
    lea dx,evenm
    int 21h
    
    sub bl,1
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    ret
    
    main endp
end main
