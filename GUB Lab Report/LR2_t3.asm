org 100h
.model small
.stack 100h
.data   

    msg1 db ?
    msg2 db ?
    txt1 dw  "Input A Number: $"  
    txt2 dw  "Number is Divisible By 5$" 
    txt3 dw  "Number is not Divisible By 5$" 
    next db  013,010,"$" 
     
.code
    main proc    
        
        mov ax,@data        
        mov ds,ax  
        
        mov ah , 9h
        lea dx , txt1      ;displaying text 1 
        int 21h            ;Input A Number:
        
        mov ah,1h           
        int 21h            ;input1
        mov bl, al 
        
        mov ah , 9h
        lea dx , next      ;printing newline 
        int 21h 
        
        mov al,bl
        mov bh,5
        div bh
        
        cmp ah,0
        je l1 
        
        mov ah , 9h
        lea dx , next      ;displaying text 1 
        int 21h
        
        
        mov ah , 9h
        lea dx , txt3      ;displaying text 1 
        int 21h
        ret
        
        l1:
        mov ah , 9h
        lea dx , next      ;displaying text 1 
        int 21h
        
        
        mov ah , 9h
        lea dx , txt2      ;displaying text 1 
        int 21h
        ret
        
              
        
        
        
    main endp 
 end main