org 100h
.model small
.stack 100h
.data   

    msg1 db ?
    msg2 db ?
    txt1 dw  "Enter the Character: $"   
    CONSONANT DB 0DH,0AH,'CONSONANT$'
    VOWEL DB 0DH,0AH,'VOWEL$'
     
.code
    MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,9
        LEA DX , TXT1
        INT 21H  
        
        MOV AH ,1            ;INPUT
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