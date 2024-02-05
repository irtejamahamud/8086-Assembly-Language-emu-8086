print_msg macro msg
    mov ah,9
    lea dx,msg
    int 21h
endm

org 100h
.stack 100h
.model small
.data
      array db 10 (?)  
      msg db 10,13,"Enter The Size : $" 
      inputmsg db 10,13,"Enter The Array : $"
      oddmsg db 10,13,"Odd Sum : $" 
      evenmsg db 10,13,"Even Sum : $" 
      a db ?
      evensum db ?
      oddsum  db ?
.code

main proc  

      mov ax,@data
      mov ds,ax 
      
      call input 
      
      mov cx,0000h
      mov cl,a
      mov si,0        
      
      calculate_sum:
          mov al,array[si]  
          mov bl,al
          mov bh,2
          div bh
          mov al,ah
          inc si
          cmp al,0
          je l1
          
          call odd_sum 
          sub cx,1
          jmp calculate_sum     
             
         l1:
          call even_sum
        loop calculate_sum
         
        mov al,evensum
        mov bl,oddsum
        
      ret
main endp 

input proc
     
    print_msg msg
    
    mov ah,1
    int 21h 
    sub al,48
    mov a,al 
    
    mov cx,0000h
    mov cl,a
    mov si,0
    
    print_msg inputmsg
    
    initialize: 
    
    mov ah,1
    int 21h
    sub al,48
    mov array[si],al
    inc si
    
    mov ah,2
    mov dl,32
    int 21h
     
    loop initialize
    
    ret
  input endp  

even_sum proc 
    
    add evensum,bl
    ret
  even_sum endp 
odd_sum proc
    
    add oddsum,bl
    ret
  odd_sum endp


end main
