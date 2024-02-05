org 100h
.model small
.stack 100h
.data 
   var dw 100
.code
    main proc  
        
        mov ah,1 
        int 21h            ;Input One
        mov bl,al
        mov cl,bl
        
        mov ah,2
        mov dl ,032        ;Generating Space 
        int 21h 
        
        
        mov ah,1 
        int 21h            ;Onput Two
        add bl,al          ;Addition Operation
        sub cl,al           ;sub  
        mov al,cl
        
        mov ah,2
        mov dl ,010        ;Generating New_Line
        int 21h
        
        mov dl,013         ;cret to new line
        int 21h
        
          
        mov ah ,2
        mov dl,bl          ;Displaying The Result
        sub dl,48
        int 21h  
        
        
        mov ah,2
        mov dl ,010        ;Generating New_Line
        int 21h
        
        mov dl,013         ;cret to new line
        int 21h 
        
        mov ah ,2
        mov dl,cl          ;Displaying The Result
        add dl,48
        int 21h
        
    
    main endp 
 end main