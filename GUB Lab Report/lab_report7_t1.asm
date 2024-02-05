
evenodd macro 
    
   mov bh,al
   
   mov bl,2
   div bl 
   mov al,ah 
   
   cmp al,0 
   je l1
   
   mov al,bh
   call odd_sum 
   
   mov ah ,9
   lea dx,odd
   int 21h
   
   mov ah ,2
   mov dl, oddsum
   int 21h 
   
   jmp main
   
   l1: 
    mov al,bh
   call  even_sum 
    mov ah ,9
    lea dx,even
    int 21h
    
    mov ah ,2
    mov dl,evensum
    int 21h
   
endm


input macro array 
    mov ah ,9
    lea dx,msg
    int 21h
    
    mov cx,6
    mov si,0
    
    loop1: 
    
    mov ah,01
    int 21h 
    
    sub al,48
    
    mov array[si],al
    inc si
    loop loop1
    
    
endm 

output macro array 
    mov ah ,9
    lea dx,msg2
    int 21h
    
    mov cx,6
    mov si,0
    
    loop3: 
    
    mov ah,2
    mov dl,array[si] 
    add dl,48
    int 21h
    
    inc si
    loop loop3
    
    
endm


org 100h
.stack 100h
.model small
.data
      a db ? 
      array db 6 dup(?) 
      msg db 10,13,"Enter The Array :$"
      msg2 db 10,13,"Output: $"
      odd db 10,13,"Odd Digits $" 
      even db 10,13,"Even Digits $"
      evensum db ?
      oddsum db ?
      
.code

main proc  

    mov ax,@data
    mov ds,ax    
      
    input  array 
    output array
      
    mov cx,6
    mov si,0
    
    loop2: 
    mov ah ,9
    lea dx,msg
    int 21h
    
    
    mov al , array[si] 
    evenodd 
    inc si
    
   
    loop loop2
    
      
      
main endp 

even_sum proc  
    add evensum,al    
even_sum endp 

odd_sum proc 
    add oddsum,al  
    
odd_sum endp

end main
