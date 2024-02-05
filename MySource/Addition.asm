org 100h
.model small
.stack 100h
.data 
   var dw 100  
   msg dw "Enter A Number: $"
.code
    main proc  
        
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV BH,AL 
    
    MOV AH,2 
    MOV DL,013
    INT 21H
    
    MOV AH,2 
    MOV DL,010
    INT 21H
    
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    MOV AH,2 
    MOV DL,BH
    INT 21H
        
    
    main endp 
 end main