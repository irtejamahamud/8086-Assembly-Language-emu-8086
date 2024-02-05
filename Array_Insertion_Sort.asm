org 100h
.model small
.data
     myArray db 3,6,1,9,5
     arraySize dw 5
     sorted_msg db "Sorted Elements are: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, arraySize                ;insertion sort
    mov si, 1 
    
outer_loop:
    cmp si, cx
    jge end_sort 
    
    mov al, [myArray + si] 
    mov di, si
    
inner_loop:
    cmp di, 0 
    jle next_iteration
    
    mov bl, [myArray + di - 1] 
    
    cmp bl, al 
    jle next_iteration n
    
    
    mov [myArray + di], bl
    dec di
    jmp inner_loop
    
next_iteration:
    mov [myArray + di], al 
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
    add dl,48
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