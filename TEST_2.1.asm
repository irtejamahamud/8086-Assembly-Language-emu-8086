INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
firstname DB 50 DUP(?)
lastname DB 50 DUP(?)
R DB 100 DUP(?) 
len1 dw ?
len2 dw ?
len3 dw ?
len4 dw ? 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    printn 
    PRINT 'Enter Your First Name:'
    MOV DX, 50
    LEA DI, firstname
    CALL GET_STRING 
    
    PRINT 'Enter Your Last Name:'
    MOV DX, 50
    LEA DI, lastname
    CALL GET_STRING
    PRINTN 
    
    
    printn
    call CountLength
    printn
    
    Go:
    call StringConcate
    printn
    
   

EXIT: 

    MOV AH, 4CH
    INT 21H
MAIN ENDP


CountLength proc
      
      MOV SI, 0  
  CALCULATE_LENGTH:  
    CMP BYTE PTR [firstname + SI], 0 ;compare with null equal to 0
    ; CMP [A+si], 0 
    JE  next  
    INC SI  
    JMP CALCULATE_LENGTH 
    
    next:
    mov len1,si 
    
    MOV SI, 0  
  CALCULATE_LENGTH2:  
    CMP BYTE PTR [lastname + SI], 0 ;compare with null equal to 0
    ; CMP [A+si], 0 
    JE Go  
    INC SI 
    mov len2,si 
    JMP CALCULATE_LENGTH2
   
    
    ret
    
      
CountLength endp 

StringConcate proc
     
    lea di,R
    lea si,firstname 
    mov cx,len1
    l1:
    mov al,[si]
    cmp al,'$'
    je next1
    
    mov [di],al
    
    inc si
    inc di
    loop l1
    
    
    next1:
    inc di
    lea si,lastname
    mov cx,len2
    
    l2:
    mov al,[si]
    cmp al,'$'
    je final
    mov [di],al
    inc si
    inc di
    Loop l2
    
    final: 
    INC DI
    MOV [DI, '$'] 
    printn
    print 'Result:'
    mov ah,9
    lea dx,R
    int 21h
StringConcate endp    



DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_GET_STRING 
define_print_string

end main