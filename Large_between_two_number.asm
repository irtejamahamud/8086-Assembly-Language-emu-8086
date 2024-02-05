org 100h
.model small
.stack 100h
.data 
msg dw 10,13,"Enter First Number: $"   
msg1 dw 10,13,"Enter Second Number: $" 
large dw 10,13,"First Number Is Large $" 
small dw 10,13,"Second Number Is Large $"
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
    
    mov ah,9
    lea dx,msg1 
    int 21h
    
    mov ah,1
    int 21h
    sub al,48 
    mov ah,0
    mov num2,al 
   
    mov bl,num1             
    mov bh,num2
    cmp bl,bh            
    jae l1 
    
    mov ah,9
    lea dx,small
    int 21h 
    
    ret
    
    l1:
    mov ah,9
    lea dx,large
    int 21h
    
    ret
    
    main endp
end main
