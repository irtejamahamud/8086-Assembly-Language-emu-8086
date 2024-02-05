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
    CONSONANT DB 0DH,0AH,'CONSONANT$'
    VOWEL DB 0DH,0AH,'VOWEL$'
     
.code
    main proc    
        
        mov ax,@data        
        mov ds,ax  
        
        mov ah , 9h
        lea dx , txt1      ;displaying text 1 
        int 21h            ;Input your first char:
        
        mov ah,1h           
        int 21h            ;input
        mov bl, al 
        
        mov ah , 9h
        lea dx , next      ;printing newline 
        int 21h
        
         
        MOV AL,BL      
        CMP AL,'A'
        JE VL
        CMP AL,'E'
        JE VL
        CMP AL,'I'
        JE VL
        CMP AL,'O'
        JE VL                 ;checking vowel
        CMP AL,'U'
        JE VL
        CMP AL,'a'
        JE VL
        CMP AL,'e'
        JE VL
        CMP AL,'i'
        JE VL
        CMP AL,'o'
        JE VL
        CMP AL,'u'
        JE VL 
        
        LEA DX,CONSONANT
        MOV AH,9
        INT 21H
        ret
  
        VL:
        LEA DX,VOWEL
        MOV AH,9
        INT 21H          
    
    main endp 
 end main