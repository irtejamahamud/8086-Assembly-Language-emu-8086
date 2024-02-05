showmsg macro txt 
    mov dx ,offset txt
    mov ah,9
    int 21h    
endm

org 100h
.model small
.stack 100h
.data

 ;a db 50 dup(?)  
 msg1 db "Enter First String: $" 
 msg3 db "Enter Last String: $"
 msg2 db "Both String Matched: $"
 msg4 db "String UN-Matched: $" 

 newline db 10,13,"$"  
 space db 32,"$"
 first_name db 20 dup(?)
 last_name db 20 dup(?)
 
 
 .code 
 main proc 
    mov ax,@data
    mov ds,ax
    
    showmsg msg1
   ; strint_input first_name 
   
    mov si,0
    
    input:
    mov ah,1
    int 21h               
    cmp al,13
    je next 
    
    mov first_name[si],al
    inc si
    jmp input
    
    next: 
    mov first_name[si],"$" 
    
    showmsg newline
    showmsg msg1
    ;strint_input last_name  
    mov si,0
    
    input1:
    mov ah,1
    int 21h               
    cmp al,13
    je next1 
    
    mov last_name[si],al
    inc si
    jmp input1
    
    next1: 
    mov last_name[si],"$" 
    
    
     mov si, offset first_name
     mov di, offset last_name
        
     compare_string:
       mov al, [di]
       mov bl, [di]
       cmp al,bl
                
       jne not_equal
       cmp al,0
                
       je equal
                
       inc si
       inc di
       jmp compare_string
                
     not_equal: 
       showmsg newline
       showmsg msg4
       jmp end_program
                
     equal:  
       showmsg newline
       showmsg msg2
                
     end_program:
       MOV AH, 4ch
       INT 21h

    main endp 
end main
 