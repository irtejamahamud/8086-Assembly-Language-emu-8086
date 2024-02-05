org 100h
.model small
.stack 100h
.data 
   var dw 100  
   msg dw "Temparature In Celcius: $" 
   msg1 dw "Temparature In Fahrenheit: $"
   tc dw 0    ; t celsius.
   tf dw 1000      ; t fahrenheit.
   next db 013,010,"$"
.code
    main proc  
        
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    
    MOV AH,2
    MOV DX,Tf
    INT 21H
    
    ; convert fahrenheit to celsius according
    ; to this formula: c = (f - 32) * 5 / 9

    MOV cx, tf
    SUB cx, 32
    MOV ax, 5
    IMUL cx
    MOV cx, 9
    IDIV cx
    MOV tc, ax
    
    MOV AH,9
    LEA DX,next
    INT 21H
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    
        
    MOV AH,2
    MOV DX,Tc
    INT 21H
    
    main endp 
 end main