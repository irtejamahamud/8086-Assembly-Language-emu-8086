include 'emu8086.inc'

.model small
.stack 100h
.data 
   
   array db 20 dup(?)
   n db ?
   msg db "Number: $" 
   newline db 10,13,"$"

.code
main proc  
    mov ax,@data
    mov ds,ax 
    
    print 'Enter the size:' 
    mov ah,1
    int 21h         ;size input
    sub al,48
    mov n,al
    
    mov cx,0
    mov cl,n
    mov si,0 
    
    print 'Enter the value:' 
    input:
    mov dx,offset newline
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48               ;array input
    mov array[si],al
    inc si
    
    loop input
    
    
    mov cx,0
    mov cl,n
    mov si ,offset array        
    mov bl,[si] 
            
    loopx:  
     cmp [si],bl  
     jle update       ;less then equla <=
     resume:
     inc si
    
    loop loopx  
    
    print 'Number :'
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
     jmp exit
    
    update:
    mov bl,[si]
    jmp resume
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
