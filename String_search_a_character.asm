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
    
endm

search_char macro 
         mov bx,0
     mov bl,len
    
     xor si, si
     search_loop:
        cmp si, bx
        je value_not_found
        
        mov al, [a+si]
        cmp al, char
        je value_found
        
        inc si
        jmp search_loop
        
        Value_found:
        showmsg newline
        showmsg found_msg
       
        jmp exit1  
        
        Value_not_found:
        showmsg newline
        showmsg not_found_msg
        
        jmp exit1 
        
      exit1: 
     ; mov ah,4ch
     ; int 21h   
    
    
     
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
 not_found_msg db 'Value not found $'
 found_msg db 'Value found $'
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
    
    showmsg newline
    showmsg msg3
    mov ah,1
    int 21h
    mov char,al  
    
    search_char
    
    main endp
end main
 