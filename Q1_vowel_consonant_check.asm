org 100h
.model small
.stack 100h
.data   

    msg1 db ?
    msg2 db ?
    txt1 dw  "Enter the Character: $"   
    CONSONANT DB ' IS CONSONANT$' 
    msg3 DB 0DH,0AH,'CHARACTER $'
    VOWEL DB ' IS VOWEL$'
     
.code
    MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,9
        LEA DX , TXT1
        INT 21H  
        
        MOV AH ,1            ;INPUT
        INT 21H 
        INC AL
        MOV BL,AL
        
        LEA DX,MSG3
        MOV AH,9
        INT 21H
        
        MOV AH,2
        MOV DL,BL
        INT 21H
        
       
       
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
        RET
  
        VL:
        LEA DX,VOWEL
        MOV AH,9
        INT 21H 
        RET         
    
    MAIN ENDP
 END MAIN