org 100h
.model small
.stack 100h
.data 
msg dw 10,13,"Enter A Number: $" 
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
    
    ;mov num1,al
    
    ;mov ah,1
    ;int 21h
    ;sub al,48
    ;mov num2 , al  
    
    mov bl,2 
    div bl               ;number is divide/2
    cmp ah,0             ;reminder in ah
    je even 
    
    mov ah,9
    lea dx,oddm
    int 21h 
    ret
    
    even:
    mov ah,9
    lea dx,evenm
    int 21h
    
    ret
    
    
   
    
    main endp
end main
