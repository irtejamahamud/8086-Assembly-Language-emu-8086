org 100h

.data

str db 10,13,"Enter the elements of array: $"
str1 db 0dh,0ah,"Ascending: $"
str2 db 0dh,0ah,"Descending: $"
array db 7dup(0)

.code
mov ah,9
lea dx,str
int 21h
mov cx,7
mov bx,offset array
mov ah,1

inputs:
int 21h
mov [bx],al
inc bx
Loop inputs

mov cx,7
dec cx

nextscan:
mov bx,cx
mov si,0

nextcomp:
mov al,array[si]
mov dl,array[si+1]
cmp al,dl
jnc noswap

mov array[si],dl
mov array[si+1],al

noswap:
inc si
dec bx
jnz nextcomp
loop nextscan

mov ah,9
lea dx,str2
int 21h

mov cx,7
mov bx,offset array

print:
mov ah,2
mov dl,[bx]
int 21h
inc bx
loop print

mov ah,9
lea dx,str1
int 21h

mov cx,7
mov bx,offset array

print2:
mov ah,2
mov dl,[bx+6]
int 21h
dec bx
loop print2

ret 