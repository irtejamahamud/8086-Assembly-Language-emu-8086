addition macro num1, num2, res, resMsg
    mov al, num1
    mov bl, num2
    
    add al, bl
    mov res, al 
    sub res, 48
    
    mov dx , offset Msg3
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, res
    int 21h   
endm

org 100h    
.model small
.stack 100h
.data 
     a db ?
     b db ?
     msg1 db 'Enter Frist Number: $'
     msg2 db 10, 13, 'Enter second Number: $'
     Msg3 db 10, 13, 'Result: $'
     result db ?
    
.code    
    main proc
        
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h  
   
    mov ah, 1
    int 21h
    mov a, al
    
    
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 1
    int 21h
    mov b, al

    
    addition a, b, result, Msg3    
    
  main endp
end main