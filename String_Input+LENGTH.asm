showmsg macro txt 
    mov dx ,offset txt
    mov ah,9
    int 21h    
endm  

input_string macro 
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
    
endm

str_length macro l 
    mov si ,offset a
    l1:
    mov al,[si]
    cmp al,'$'
    je exit
    
    inc si 
    inc len 
    loop l1
    
    exit:
    
    showmsg newline
    showmsg msg4 
    
    mov dl,len
    add dl,48
    mov ah,2
    int 21h
    
    ret
    
    
endm




org 100h
.model small
.stack 100h
.data

 a db 50 dup(?)  
 msg1 db "Enter Your String: $"
 msg2 db "Your String is: $" 
 msg3 db "Input a character: $" 
 msg4 db "Length: $"
 newline db 10,13,"$" 
 char db ? 
 len db 0
 
 
 
 
 .code 
 main proc 
    mov ax,@data
    mov ds,ax
    
    showmsg msg1 
    input_string
    
    showmsg newline
    showmsg msg2
    showmsg a 
    
    str_length len
    
   ; showmsg msg3
   ; mov ah,1
   ; int 21h
   ; mov char,al    
    
    main endp
end main
 