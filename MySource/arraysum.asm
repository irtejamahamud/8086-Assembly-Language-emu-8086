;add array elements
.model small

.data
array db 1,2,3,4,5
len db $-array
sum db ?

.code 

main proc
    mov ax,@data
    mov ds,ax

    mov cx,0000h
    mov cl,len
    mov ax,0000h
    lea si,array

    loop1:  add al,[si]
        inc si
        loop loop1 
    mov bl,al
    

    mov ah,02
    mov dl,bl
    int 21h
main endp
end main
