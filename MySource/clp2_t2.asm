org 100h
.model small
.stack 100h
.data  
  
   input1 dw  "Enter A Number: $"  
   text1  dw  "This Is An Odd Number $"  
   text2  dw  "This Is A Even Number $"
   next   db  013,010,"$" 
     
.code
    main proc    
       
        mov ax,@data        
        mov ds,ax 
        
        mov ah , 9h
        lea dx , input1      ;displaying text 1 
        int 21h              ;Input Taking Massage: 
        
        
        mov ah,1h           
        int 21h              ;input1
        ;mov num1, al 
  
        
        mov bl,2
        div bl 
        
        mov al,ah            ;riminder stored in ah
        
 
        cmp al,0
        
        je l1
         
         mov ah,9
         lea dx,next          ;newline
         int 21h 
         
         mov ah,9
         lea dx,text1
         int 21h
         ret 
        
       
        l1: 
        
         mov ah,9
         lea dx,next          ;newline
         int 21h
         
         mov ah,9
         lea dx,text2
         int 21h  
         ret
          
   
    main endp
 end main