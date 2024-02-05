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
 msg1 db "Enter Your First Name: $" 
 msg3 db "Enter Your Last Name: $"
 msg2 db "Your Name: $"  
 newline db 10,13,"$"  
 space db 32,"$"
 first_name db 20 dup(?)
 last_name db 20 dup(?) 
 full_name db 40 dup(?)
 
 
 .code 
 main proc 
    mov ax,@data
    mov ds,ax
    
    showmsg msg1
   ; strint_input first_name 
    call first_name_input
    
    showmsg newline
    showmsg msg1
    ;strint_input last_name  
    call last_name_input
    call StrConcate
    
    showmsg newline
    showmsg msg2
    
    lea dx,full_name
    mov ah,9
    int 21h

    ret
    
    main endp 
 
first_name_input proc  
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
   
    ret
  first_name_input endp  

last_name_input proc 
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
    ret
    last_name_input endp 

StrConcate proc 
    MOV SI,0
    MOV DI,0 
    
  CONT1:
    MOV DL,first_name[SI]      
    MOV full_name[DI],DL
    INC SI
    INC DI
    CMP DL,'$'
    JE TEMP
    JNE CONT1
   
  TEMP:
    DEC DI
    MOV SI,0
    MOV full_name[DI],'_'
    INC DI
    JMP CONT2
   
  CONT2:
    MOV DL,last_name[SI]
    MOV full_name[DI],DL
    INC SI
    INC DI
    CMP DL,'$'
    JE  l1
    JNE CONT2
    
    
    l1:
    dec di
    mov full_name[di],"$" 
    
    ret
    
    StrConcate endp    
     
end main
 