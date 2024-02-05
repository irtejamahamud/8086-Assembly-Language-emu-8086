org 100h
.model small
.stack 100h
.data   

    num1 db 10 ;
    num2 db ?
    txt1 dw  "Enter the Number of loop: $"  
    txt2 dw  "Enter a number to devide: $" 
    txt3 dw  "Sum: $" 
    next db  013,010,"$" 
     
.code
    main proc 
      mov ah,9h
      lea dx,txt1
      int 21h
      mov ah,1
      int 21h 
      mov bl,al
       
      mov cx ,bx 
      
      mov ah , 9h 
      lea dx , next         
      int 21h
      xor bx,bx
      
      l1: 
      add bx,cx
     
      loop l1  
      
      mov ah ,2
      mov dx,bx
      int 21h
  
               
    main endp 
 end main