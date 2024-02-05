org 100h
.stack 100h
.model small

.data
    digits db 5 dup(?)   
    msg db 13, 10, "Enter the elements of array (5 digits): $"
    avg_msg db 13, 10, "AVERAGE = $"
    lrg_msg db 13, 10, "LARGEST = $"
    sml_msg db 13, 10, "SMALLEST = $" 
    len db ?
    average db ?
    largest db ?
    smallest db ?

.code

main proc
    mov ax, @data
    mov ds, ax

    call initialize
 
    call average_cal
    call calculate
    call display_output

    mov ah, 4ch
    int 21h
main endp

initialize proc
    lea dx, msg
    mov ah, 9
    int 21h

    mov cx, 5
    mov si, 0
     
input_loop:
    mov ah, 1
    int 21h

    sub al, '0'     
    mov digits[si], al

    inc si   
    
    mov dl,32
    mov ah,2
    int 21h
    loop input_loop

    ret
initialize endp  

average_cal proc 
    mov cx, 0000h
    mov cl, 5
    mov ax, 0000h
    mov si,0

loop1:  
    add al, digits[si]
    inc si
    loop loop1

    mov len, 5 
    div len
    mov average, al 

    ret
average_cal endp


calculate proc
    mov cx, 5
    mov si, 0
    mov bl, digits[si] ; Initialize largest with the first digit
    mov bh, digits[si] ; Initialize smallest with the first digit
    xor ax, ax        

calculation_loop:
    cmp digits[si], bl 
    jg update_largest

    cmp digits[si], bh 
    jl update_smallest

    jmp next_iteration

update_largest:
    mov bl, digits[si] ; Update largest
    jmp next_iteration

update_smallest:
    mov bh, digits[si] ; Update smallest

next_iteration:
    inc si
    loop calculation_loop

    mov largest, bl
    mov smallest, bh

    ret
calculate endp

display_output proc
    lea dx, avg_msg
    mov ah, 9
    int 21h

    mov dl, average
    add dl, '0'         
    mov ah, 2
    int 21h

    lea dx, lrg_msg
    mov ah, 9
    int 21h

    mov dl, largest
    add dl, '0'
    mov ah, 2
    int 21h

    lea dx, sml_msg
    mov ah, 9
    int 21h

    mov dl, smallest
    add dl, '0'
    mov ah, 2
    int 21h

    ret
display_output endp

end main
