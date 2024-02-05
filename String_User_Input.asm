showmsg macro txt 
    mov dx ,offset txt
    mov ah,9
    int 21h    
endm


org 100h
.model small
.stack 100h
.data

 a db 50 dup(?)  
 msg1 db "Enter Your String: $"
 msg2 db "Your String is: $"  
 newline db 10,13,"$"
 
 
 .code 
 main proc 
    mov ax,@data
    mov ds,ax
    
    showmsg msg1
    mov si,0
    
    input:
    mov ah,1
    int 21h               ;it will take input until the enter is pressed
    cmp al,13
    je next 
    
    mov a[si],al
    inc si
    jmp input
    
    next: 
    mov a[si],"$"
    showmsg newline
    showmsg msg2
    
    mov dx,offset a
    mov ah,9
    int 21h
    
    
    main endp
end main
 