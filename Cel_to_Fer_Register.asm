org 100h
.model small
.stack 100h
.data 
   var dw 100  
   msg dw "Temparature In Celcius: $" 
   msg1 dw "Temparature In Fahrenheit: $"
   tc dw 260    ; t celsius.
   tf dw 0      ; t fahrenheit.
   next db 013,010"$"
.code
    main proc  
        
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,9
    LEA DX,MSG
    INT 21H 
    
    MOV AH,2
    MOV DX,TC
    INT 21H
    
    ; convert celsius to fahrenheit according
    ; to this formula: f = c * 9 / 5 + 32

    MOV cx, tc
    MOV ax, 9
    IMUL cx
    MOV cx, 5
    IDIV cx
    ADD ax, 32
    MOV tf, ax
    
    MOV AH,9
    LEA DX,next
    INT 21H
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    
        
    MOV AH,2
    MOV DX,Tf
    INT 21H
    
    main endp 
 end main