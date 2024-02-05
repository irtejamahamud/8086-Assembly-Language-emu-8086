org 100h
.stack 1000
.model small
.data
      a db 10 dup(?) 
      msg1 db 10,13,"Enter The Elements Of Array: $"
      avg  db 10,13,"Avarage = $" 
      lrg  db 10,13,"Largest = $"
      sml  db 10,13,"Smallest = $"
      
.code

main proc  
    mov ax,@data
    mov ds,ax  
    call initialize
    
    call print
    
    ret

main endp

initialize proc 
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    
    mov cx,5 
    mov si ,0

initializel:    
       mov ah,1
       int 21h

       mov a[si],al         ;initailize
       inc dl
       inc si
    loop initializel
    ret
  initialize endp  

print proc 
    
 
    mov cx, 5 
    mov si ,0 
printf:
    mov ah,2
    mov dl,a[si]
    int 21h
    inc si  
    
    mov ah,02
    mov dl,032
    int 21h
    
    cmp si,5
    je end_program 
    
    jmp printf
    
    
    end_program:
    mov ah,4ch    ;program terinate
    int 21h
    
  ret  
  print endp

end main
