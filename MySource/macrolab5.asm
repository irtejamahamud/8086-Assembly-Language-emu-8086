addition macro num1,num2,
    mov ax,num1
    mov bx,num2
    add ax,bx
endm    

str macro string
    mov dx,offset string
    mov ah,9
    int 21h 
    endm

org 100h
.data
a dw 10
b dw 5  
msg1 dw "CSE 304$"
msg2 dw "Microprocessor Lab$"

.code
main proc  
    mov ax,@data
    mov ds,ax
    
    str msg1
    str msg2
    addition a,b
main endp 


end main
