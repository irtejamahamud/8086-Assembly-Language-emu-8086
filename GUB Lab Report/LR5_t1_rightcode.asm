org 100h
.model small
.stack 100h
.data
    array db 9 dup(?)  
    msgSize db "Enter The Size: $" 
    msgInput db 10,13,"Enter The Array : $"
    Odd_result db 10,13,"Summation Of Odd Numbers : $"
    Even_result db 10,13,"Summation Of Even Numberes : $"
    k dw ?
    Even_Sum dw 0 
    Odd_Sum dw 0 

print_msg macro msg
     mov ah,9 
     lea dx,msg
     int 21h
endm 


input macro
    mov ah, 1    
    int 21h 
    sub al, '0' 
    
    mov bl,al 
 
    mov bh,0
    mov k,bx
    
    mov cx, k 
    lea di, array 
    
    print_msg msgInput
    
initialize:
    
    mov ah,1
    int 21h
    sub al,48
    
    mov [di],al                                                                                       
    
    mov ah,2
    mov dl,32
    int 21h
   
    inc di
    loop initialize        
endm  
   

output macro value 
     mov ah, 2 
     mov dl,value
     add dl,48
     int 21h    
endm


.code
main proc
    mov ax, @data
    mov ds, ax
    
    print_msg msgSize
    input
    
    mov cx,k
    lea di,array   
 calculation:
    mov al, [di] 

    and [di],1
    jnz OddSum
    
    mov ah,0
    add Even_Sum,ax
    jmp nextDigit

OddSum:
    mov ah,0
    add Odd_Sum,ax
    jmp nextDigit

nextDigit:
    inc di
    loop calculation
     ;
   
    print_msg Odd_result
    mov ax,Odd_Sum
    mov bl,10
    div bl
      
    mov bx,ax
    output bl
    output bh
  
    print_msg Even_result
    mov ax,Even_Sum
    mov bl,10
    div bl
    mov bx,ax 
    output bl
    output bh
    
    mov ah, 4ch
    int 21h 
    
main endp
end main