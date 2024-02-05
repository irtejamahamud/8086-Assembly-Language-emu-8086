org 100h
.model small
.data
    digits db 7 dup(?)   
    msg db "Enter the elements of array (7 digits): $"
    asc_msg db 13, 10, "Ascending: $"
    desc_msg db 13, 10, "Descending: $"
    
.code
main proc
    mov ax, @data
    mov ds, ax

    call initialize      
    call sort_ascending    
    call display_output_asc
    call sort_descending 
    call display_output_dsc   

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

sort_ascending proc
    mov cx, 7
    mov si, 0

asc_loop_outer:
    mov di, si
    inc di

asc_loop_inner:
    mov al, digits[di]
    cmp digits[si], al
    jg asc_swap

asc_next_iteration:
    inc di
    cmp di, 7 
    jl asc_loop_inner
    jmp asc_next_outer

asc_swap:
    mov bl, digits[si]
    mov digits[si], al
    mov digits[di], bl
    jmp asc_next_outer

asc_next_outer:
    inc si
    cmp si, 6
    jl asc_loop_outer

    ret
sort_ascending endp

sort_descending proc
    mov cx, 7
    mov si, 0

desc_loop_outer:
    mov di, si
    inc di

desc_loop_inner:
    mov al, digits[di]
    cmp digits[si], al
    jl desc_swap

desc_next_iteration:
    inc di
    cmp di, 7 
    jl desc_loop_inner
    jmp desc_next_outer

desc_swap:
    mov bl, digits[si]
    mov digits[si], al
    mov digits[di], bl
    jmp desc_next_outer

desc_next_outer:
    inc si
    cmp si, 6 
    jl desc_loop_outer

    ret
sort_descending endp

display_output_asc proc
    lea dx, asc_msg
    mov ah, 9
    int 21h

    mov cx, 7
    mov si, 0

asc_display_loop:
    mov dl, digits[si]
    add dl, '0'
    mov ah, 2
    int 21h

    mov dl, 32 
    mov ah, 2
    int 21h

    inc si
    loop asc_display_loop

    ret
display_output_asc endp

display_output_dsc proc
    lea dx, desc_msg
    mov ah, 9
    int 21h

    mov cx, 7
    mov si, 0

desc_display_loop:
    mov dl, digits[si]
    add dl, '0'
    mov ah, 2
    int 21h

    mov dl, 32 
    mov ah, 2
    int 21h

    inc si
    loop desc_display_loop

    ret
display_output_dsc endp

end main
