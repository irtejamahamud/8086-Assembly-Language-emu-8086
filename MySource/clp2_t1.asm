 org 100h
.model small
.stack 100h
.data   

    msg1 db ?
    msg2 db ?
    txt1 dw  "Input your first char: $"  
    txt2 dw  "Input your second char: $" 
    txt3 dw  "Sorted Oreder: $" 
    next db  013,010,"$" 
     
.code
    main proc    
        
        mov ax,@data        
        mov ds,ax  
        
        mov ah , 9h
        lea dx , txt1      ;Input your first char:
        int 21h            
        
        mov ah,1h           
        int 21h              ;input1
        mov bl, al 
        
        mov ah , 9h
        lea dx , next       
        int 21h 
              
        
        mov ah , 9h
        lea dx , txt2        ;Input your first char:
        int 21h           

        
        mov ah,1h           
        int 21h               ;intput 2
        mov bh, al 
        
        
        mov ah , 9h
        lea dx , next         
        int 21h 
        
        mov ah , 9h
        lea dx , txt3          
        int 21h                
        
        cmp bl,bh
        ja level1              ;checking(bl>bh)? 
                               ;if true it will enter level 1
                 
        mov ah,2
        mov dl,bh             
        int 21h 
        
        mov ah,2
        mov dl,bl             
        int 21h 
        ret
        
        
        level1:
        mov ah,2
        mov dl,bl           
        int 21h 
        
        mov ah,2
        mov dl,bh           
        int 21h 
        ret
        
       
              
    
    main endp 
 end main