org 100h
.stack 1000
.model small
.data
 
.code

main proc  
    mov ax,@data
    mov ds,ax
    
    mov ax, 1
    mov cx, 50
    xor dx, dx

Label1:
    add dx, ax
    add ax, 2
    loop Label1

main endp
end main
