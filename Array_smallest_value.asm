include 'emu8086.inc'

.model small
.stack 100h
.data 
   
   array db 7,3,4,8,2,6

.code
main proc  
    mov ax,@data
    mov ds,ax  
    
    mov si ,offset array        
    mov cx,6
    mov bl,[si] 
            
    loopx:  
     cmp [si],bl  
     jle update       ;less then equla <=
     resume:
     inc si
    
    loop loopx  
    
    print 'Smallest Value :'
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    ret
    
    update:
    mov bl,[si]
    jmp resume
    
    
    main endp
end main
