org 100h 
.model small
.data
    myArray db 15,25,35,45,55
    arraySize equ $-myArray  
    searchValue db 35
    newline db 10, 13, '$'
    not_found_msg db 'Value not found $'
    indexmsg db 10,13,"Artifact Found at Index: $"
.code 
       
  main proc
     mov ax, @data
     mov dx, ax
     
     mov cx,0 ; low index
     mov dx, arraySize ; high index
     
     binary_search:
        cmp cx, dx
        jg value_not_found
        
        mov si, cx
        add si, dx
        shr si, 1
        
        mov al, [myArray+si]
        cmp al, searchValue
        je value_found
        
        jl update_low
        jg update_high
        
    update_low:
        inc si
        mov cx, si
        jmp binary_search
        
    update_high:
        dec si
        mov dx, si
        jmp binary_search
    
        
        
        Value_found:
        mov ah,9
        lea dx,indexmsg
        int 21h
        
        mov bx,si
        add bx,48
        mov dx,bx
        mov ah,2
        int 21h
        
        
        jmp exit  
        
        Value_not_found:
        mov ah,09h
        lea dx, not_found_msg
        int 21h
        jmp exit 
        
        exit: 
        mov ah,4ch
        int 21h
    
end main 
ret

