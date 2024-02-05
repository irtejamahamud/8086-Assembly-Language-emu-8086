org 100h
.model small
.stack 100h
.data 
   var dw 100  
   msg dw "Enter Temparature In Celcius: $" 
   msg1 dw 10,13,"Temparature In Fahrenheit: $"
   tc dw 0      ; t celsius.
   tf dw 0      ; t fahrenheit.
   
.code
    main proc  
        
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,9
    LEA DX,msg
    INT 21H 
;input in celcius ---------    
    mov tc,0
    mov bl,10
    input:
    mov ah,1
    int 21h
    cmp al,13
    je next
    sub al,48
    mov ah,0
    mov cx,ax
    mov ax,tc
    mul bl
    add ax,cx
    mov tc,ax
    jmp input
    
    ; convert celsius to fahrenheit according
    ; to this formula: f = c * 9 / 5 + 32
;calculating ----------------
    next:                                 
    MOV cx, tc
    MOV ax, 9
    IMUL cx
    MOV cx, 5
    IDIV cx
    ADD ax, 32
    MOV tf, ax
      
;printing the ans in fahrenheit ------      
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    
    mov ax,tf
    mov dx,0
    mov bx,10
    mov cx,0
    
    l1:
    div bx 
    push dx
    mov dx,0
    mov ah,0
    inc cx
    cmp ax,0
    jne l1
    mov ah,2
    l2:
    pop dx
    add dx,48
    int 21h
    loop l2
    
    
    main endp 
 end main