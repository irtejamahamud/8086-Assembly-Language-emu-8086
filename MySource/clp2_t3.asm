org 100h
.model small
.stack 100h
.data  

   num1 db ?
   num2 db ?  
   input1 dw  "Enter The First Number: $"  
   input2 dw  "Enter The Second Number: $"
   text1  dw  "Number 1 is grater then number 2$"  
   text2  dw  "Number 2 is grater then number 1$"
   text3  dw  "Both Equal$"
   next   db  013,010,"$" 

     
.code
    main proc    
       
        mov ax,@data        
        mov ds,ax 
        
        mov ah , 9h
        lea dx , input1      ;displaying text 1 
        int 21h            ;Input your first char:
        
        mov ah,1h           
        int 21h              ;input1
        mov num1, al 
        
        mov ah , 9h
        lea dx , next      ;printing newline 
        int 21h 
              
        
        mov ah , 9h
        lea dx , input2      ;displaying text 2
        int 21h            ;Input your first char:
        
       
        
        mov ah,1h           
        int 21h               ;intput 2
        mov num2, al 
        
        
        mov ah , 9h
        lea dx , next          ;printing newline 
        int 21h 
       
        mov al , num1
        mov bl , num2
        cmp al,bl
       
        ja l1
        jb l2
        je l3
       
        l1:
        mov ah,9
        lea dx,text1
        int 21h  
        ret
       
        l2:
        mov ah,9
        lea dx,text2
        int 21h
        ret
       
        l3:
        mov ah,9
        lea dx,text3
        int 21h
        ret
       
     
   
    main endp
 end main