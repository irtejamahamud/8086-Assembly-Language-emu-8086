org 100h
.model small
.stack 100h
.data 
   var dw 100  
   msg dw 10,13, "Temparature In Celcius: $" 
   msg1 dw "Enter Temparature In Fahrenheit: $"
   tc dw 0      ; t celsius.
   tf dw 0      ; t fahrenheit.
.code
    main proc  
        
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
     
;user input of fahernheit -------    
    mov tf,0
    mov bl,10
    input:
    mov ah,1
    int 21h
    cmp al,13
    je next
    sub al,48
    mov ah,0
    mov cx,ax
    mov ax,tf
    mul bl
    add ax,cx
    mov tf,ax
    jmp input
    
;Converting Fahrenheit to celcius -------
    next:
    MOV cx, tf
    SUB cx, 32
    MOV ax, 5
    IMUL cx           ; convert fahrenheit to celsius according                                 
    MOV cx, 9         ; to this formula: c = (f - 32) * 5 / 9
    IDIV cx
    MOV tc, ax
    
;printing the ans in fahrenheit ------      
    MOV AH,9
    LEA DX,MSG
    INT 21H 
    
    mov ax,tc
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