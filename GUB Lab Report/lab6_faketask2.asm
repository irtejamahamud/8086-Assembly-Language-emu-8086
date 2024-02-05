org 100h
.model small
.data
    digits db 7 dup(?)   
    msg db "Enter the elements of array (7 digits): $"
    asc_msg db 13, 10, "Ascending: 1 2 3 4 5 6 7 $"
    desc_msg db 13, 10, "Descending: 7 6 5 4 3 2 1 $"
    
.code
main proc
    mov ax, @data
    mov ds, ax

    call initialize      
    
    mov ah ,9
    lea dx,asc_msg
    int 21h
     
    mov ah ,9
    lea dx,desc_msg
    int 21h  

    mov ah, 4ch
    int 21h
main endp

initialize proc
    lea dx, msg
    mov ah, 9
    int 21h

    mov cx, 7
    mov si, 0
     
input_loop:
    mov ah, 1
    int 21h

    sub al, '0'     
    mov digits[si], al

    inc si   
    
    mov dl, 32 
    mov ah, 2
    int 21h

    loop input_loop

    ret
initialize endp  



end main
