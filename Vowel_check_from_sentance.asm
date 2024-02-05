org 100h
.stack 1000
.model small
.data 

      a db 20 dup(?) 
      b db ?
      msg db 10,13,"Enter Sentence : $"
      msg1 db 10,13,"Vowel : $"
      msg2 db "Enter The Sentance Size: $"
      
.code

main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx, msg2
    int 21h
    
    mov ah,1
    int 21h              ;size of sentance
    mov b,al
    sub b,48
    
    mov cx,0000h
    mov cl, b 
    mov si ,0
    
    mov ah,9
    lea dx, msg
    int 21h
    
initialize: 
      mov ah,1
      int 21h
      mov a[si],al        ;input the string
      inc si
    loop initialize 
    
     mov cx,0000h
     mov cl, b 
     mov si ,0 
    
     mov ah,9
     lea dx, msg1
     int 21h 
    
     mov ax,0000h
vowel_check: 
    mov al,a[si] 
    inc si 
    
    CMP AL,'A'
    JE VL
    CMP AL,'E'
    JE VL
    CMP AL,'I'
    JE VL
    CMP AL,'O'
    JE VL                 ;checking vowel character by character
    CMP AL,'U'
    JE VL
    CMP AL,'a'
    JE VL
    CMP AL,'e'
    JE VL
    CMP AL,'i'
    JE VL
    CMP AL,'o'
    JE VL
    CMP AL,'u'
    JE VL  
        
     cmp cl,0
     je next
     dec cl
     jmp vowel_check:
     
     VL: 
     mov ah,2
     mov dl,al
     int 21h
  
     mov ah,02
     mov dl,032
     int 21h 
    
     cmp cl,0
     je next
     dec cl 
     
     jmp vowel_check:
         
   
     next:
     ret        

main endp
end main
