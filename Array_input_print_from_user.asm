include 'emu8086.inc'
next macro txt
    mov dx,offset txt
    mov ah,9
    int 21h
endm 

showmsg macro msg
    mov dx,offset msg
    mov ah,9
    int 21h
    endm

.model small
.stack 100h
.data
    a db 10 dup(?) 
    b db ? 
    newline db 10,13,"$"  
    msg1 db "Enter the Size Of Array: $"  
    msg2 db "The array elements are: $"
    msg3 db "Enter the Array : $"
    

.code

main proc 
    mov ax,@data
    mov ds, ax 
    
    showmsg msg1
    ;print 'Enter the Size of Array :'
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov cx,0
    mov cl,b
    mov si,0 
    
    next newline
    showmsg msg3
    
    ;print 'Enter the Array : '
    
    input: 
    mov ah,1
    int 21h
   ;sub al,48            ;ascii to digit if need
   
    mov a[si],al
    inc si
    loop input 
    
    mov cx,0
    mov cl,b
    mov si,0
    
    next newline
    
    ;print 'The array elements are: '    ;emu8086 print function
    showmsg msg2
    
    printarray: 
    mov dl,a[si]
    mov ah,2
    int 21h
    
    mov dl,32
    mov ah,2
    int 21h 
    inc si
    
    loop printarray
    
    
    main endp
end main