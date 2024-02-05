addition macro msg1,msg2,res, resMsg 
    
    mov ah, 9
    lea dx, msg1
    int 21h  
   
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 1
    int 21h
    mov bh, al
     
    add bl, bh
    mov res, bl 
    sub res, 48
    
    mov dx , offset resMsg
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, result
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
    
    addition msg1,msg2,result, Msg3    
    
  main endp
end main