org 100h
.model small
.stack 100h
.data
    user_input db ?
    msg db "Enter a number (N to exit): $"
    even_msg db " -:Even$"
    odd_msg db " -:Odd$"
    newline db 13, 10, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

input_loop:
    mov ah, 9
    lea dx, msg
    int 21h

    mov ah,1
    int 21h

    cmp al, 'n'
    je exit_program

    ; Convert ASCII input to binary (numerical value)
    sub al, '0'

    test al, 1
    jz is_even

is_odd:
    mov ah, 9
    lea dx, odd_msg
    int 21h 
    
    mov ah, 9
    lea dx, newline
    int 21h
    jmp input_loop

is_even:
    mov ah, 9
    lea dx, even_msg
    int 21h 
    
    mov ah, 9
    lea dx, newline
    int 21h
    jmp input_loop

exit_program:
    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main
