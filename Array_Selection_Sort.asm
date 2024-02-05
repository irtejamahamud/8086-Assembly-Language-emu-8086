org 100h
.model small
.data
     myArray db 'E', 'A', 'D', 'B', 'C'
     arraySize dw 5
     sorted_msg db "Sorted Elements are: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, arraySize                      ;selection
    mov si, 0
    
outer_loop:
    cmp si, cx
    jge end_sort
    
    mov di, si
    
inner_loop:
    cmp di, cx
    jge next_iteration
    
    mov al, [myArray + di]
    mov bl, [myArray + si]
    
    cmp al, bl
    jb update_min
    
    inc di
    jmp inner_loop
    
update_min:
    mov al, [myArray + di]
    mov ah, [myArray + si]
    mov [myArray + si], al
    mov [myArray + di], ah
    
    inc di
    jmp inner_loop
    
next_iteration:
    inc si
    jmp outer_loop
    
end_sort:
    mov ah, 9
    lea dx, sorted_msg
    int 21h
    
    mov si, 0
print_array:
    mov ah, 2
    mov dl, [myArray + si]
    int 21h
    
    inc si
    cmp si, arraySize
    je end_program
    
    jmp print_array
    
end_program:
    mov ah, 4ch
    int 21h
main endp
end main