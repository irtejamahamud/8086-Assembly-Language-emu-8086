include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data 
   
   array db 1,2,3,4,5

.code
main proc  
    mov ax,@data
    mov ds,ax  
    
    mov si ,offset array        ;keepin the first address of the array
    mov cx,5 
    ;mov si,0
    
    print 'Array Value: '         ;from lib function
    
    loopx:  
     mov dl,[si]                ;printing the value in the address
     add dl ,48  
     
     mov ah,2
     int 21h 
     
     mov dl,32
     mov ah,2
     int 21h
     inc si
    
    loop loopx
    
    
    main endp
end main
