org 100h
.model small
.stack 100h
.data 

msg1 dw 10,13,"Enter the first number: $" 
msg2 dw 10,13,"Enter the second number: $"
summ dw 10,13,"The Sum is : $" 
subm dw 10,13,"The Sub is : $"
divm dw 10,13,"The Division is : $"
mulm dw 10,13,"The Multiplication : $"
a db ?
b db ?

.code
main proc 
   mov ax,@data
   mov dx,ax
     
   mov ah ,9
   lea dx,msg1         ;input msg 1
   int 21h 
   
   mov ah,1
   int 21h
   mov bl,al 
   mov a, bl
    
   mov ah ,9
   lea dx,msg2         ;input msg 2
   int 21h       
   
   mov ah ,1 
   int 21h
   mov bh, al 
   mov b,bh
;addition--------------   
   add bl,bh 
   sub bl,48
     
   mov ah ,9
   lea dx,summ         ;sum
   int 21h
   
   mov ah,2
   mov dl,bl           ;sum
   int 21h 
   
;subtraction----------   
   mov bl, a
   mov bh, b
   
   sub bl,bh
   add bl,48
   
   mov ah,9
   lea dx , subm       ;sub
   int 21h 
   
   mov ah,2
   mov dl, bl          ;sub
   int 21h  
   
;multiplication---------   
   mov al,a
   sub al,48          ;ascii to number
   mov bl,b
   sub bl,48          ;ascii to number
   mul bl             ;multiplication and store it in al
   add al,48          ;main number +48
   
   
   mov bl,al          ;storing it in bl
  
   mov ah,9
   lea dx,mulm
   int 21h
   
   mov ah,2
   mov dl,bl
   int 21h 

;division----------------   
   mov al,a
   sub al,48
   mov bl,b
   sub bl,48
   
   div bl
   
   add al ,48
   mov bl ,al
    
   mov ah,9
   lea dx,divm       ;div
   int 21h
   
   mov ah,2
   mov dl,bl         ;
   int 21h
   
   
    
    main endp
end main