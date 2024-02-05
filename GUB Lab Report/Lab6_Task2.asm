addition macro msg1,msg2,res, resMsg 
    
    mov bl , a
    mov bh ,b
     
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

input macro a,b 
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
     
    input a,b
    
    addition msg1,msg2,result, Msg3    
    
  main endp
end main