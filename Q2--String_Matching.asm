ORG 100H
.model small
.stack 0100H
.data
    string1 db 'Hello World', 0
    string2 db 'Hello World',0
    string3 db 'String Matched: Access Granted $'
    string4 db 'String do not Matched: Access Denied $'    
 
.code
      main proc
        mov ax, @data
        mov ds, ax
                
     
      main endp
      

StrMatched proc 
     mov si, offset string1
        mov di, offset string2
        
            compare_string:
                mov al, [di]
                mov bl, [di]
                cmp al,bl
                
                jne not_equal
                cmp al,0
                
                je equal
                
                inc si
                inc di
                jmp compare_string
                
            not_equal:
                mov dx, offset strin g4
                mov ah, 9
                int 21h
                
                jmp end_program
                
            equal:
                mov dx, offset string3
                mov ah, 9
                int 21h
                
            end_program:
            MOV AH, 4ch
            INT 21h
         
   StrMatched endp  
end main




