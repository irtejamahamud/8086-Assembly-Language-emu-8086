include 'emu8086.inc'
showmsg macro txt  
    mov dx,offset txt
    mov ah,9
    int 21h
    
endm

org 100h 
.model small
.data
    myArray db 15,10,28,19,12,40,43
    arraySize dw 7 
    searchValue db 40 
    sv dw 40
    newline db 10, 13, '$'
    not_found_msg db 'Value Not Found $'
    found_msg db 'Result Found At Index:$'
    resultmsg db 10,13, "One Fourth Of the Result: $" 
    num dw 10  
    res dw ?
.code 
       
  main proc
     mov ax, @data
     mov dx, ax
     
     xor si, si
     search_loop:
        cmp si, arraySize
        je value_not_found
        
        mov al, [myArray+si]
        cmp al, searchValue
        je value_found
        
        inc si
        jmp search_loop
        
        Value_found:
        showmsg found_msg
        mov bx, si
        add bx,48
        mov dx,bx
        add dx,1
        mov ah,2
        int 21h
        jmp next  
        
        Value_not_found:
        mov ah,09h
        lea dx, not_found_msg
        int 21h
        jmp exit 
        
        
        next:  
        
        showmsg resultmsg 
     
        mov bh,0
        mov bl,searchValue
        
        mov ax,bx 
        xor cx,cx
        mov cl,4
        div cl
        mov res,ax
        mov ax,res
        call print_num_uns
        ret
    
        exit: 
        mov ah,4ch
        int 21h  
         

define_scan_num
define_print_num_uns
define_print_num     
end main 


