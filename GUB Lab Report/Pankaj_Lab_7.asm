org 100h
.model small
.stack 100h
.data
    array db 9 dup(?) 
    msgInput db "ENTER THE SIZE OF ARRAY : $"
    Inputmsg db 10,13,"ENTER THE ARRAY : $"
    msgOdd db 10,13, "ODD DIGITS : $"
    msgEven db 10,13, "EVEN DIGITS : $"
    msgTotal db 10,13, "TOTAL SUM : $"
    sum dw 0
    k dw ?
    EvenVal dw 0 
    OddVal dw 0 

Print_msg macro m
     mov ah,9 
     lea dx,m
     int 21h
endm 

TotalSum macro a 
  
    mov bh, a
    mov al, bh
    add al, 1  
    mul bh
    mov dl, 2
    div dl
    mov sum, ax

endm

input macro
    mov ah, 1   
    int 21h 
    sub al, '0' 
    
    mov bl,al 
       
    TotalSum al
    mov bh,0
    mov k,bx
    
    mov cx, k 
    lea di, array  
    
    Print_msg Inputmsg
inputLoop:
    
    mov ah,1
    int 21h
    sub al,48 
    
    mov [di],al                                                                                       
    
    mov ah,2
    mov dl,32
    int 21h
   
    inc di
    loop inputLoop        
endm  
    
output macro value 
     mov ah, 2 
     mov dl,value
     add dl,48
     int 21h    
endm

EvenDigit macro
   Print_msg msgEven
   mov ax,EvenVal
   mov bl,10
   div bl
   mov bx,ax 
   output bl
   output bh
endm

OddDigit macro
   Print_msg msgOdd
   mov ax,OddVal
   mov bl,10
   div bl
      
   mov bx,ax
   output bl
   output bh
endm

Total_Sum macro
   Print_msg msgTotal
   mov ax,sum
   mov bl,10
   div bl
      
   mov bx,ax
   output bl
   output bh
endm

SumOddEven macro 
    mov cx,k
    lea di,array   
calculateLoop:
    mov al, [di]  

    
    and [di],1
    jnz OddSum
    
    mov ah,0
    add EvenVal,ax
    jmp nextDigit

OddSum:
    mov ah,0
    add OddVal,ax
    jmp nextDigit

nextDigit:
    inc di
    loop calculateLoop
     
endm


.code
main proc
    mov ax, @data
    mov ds, ax
    
    Print_msg msgInput
    input

    SumOddEven
    OddDigit
    EvenDigit 
    Total_Sum
    
    
    mov ah, 4ch
    int 21h
main endp
end main