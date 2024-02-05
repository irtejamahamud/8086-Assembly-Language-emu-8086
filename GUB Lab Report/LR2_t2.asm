org 100h
.data 
txt1 dw  "Input: $"  
msg1 db 'Character$'
msg2 db 'Digit$'
msg3 db 'Others$'
next db 013,010,"$"

.code

main proc 
mov ax,@data        
mov ds,ax  
        
mov ah , 9h
lea dx , txt1      ;displaying text 1 
int 21h 

;input

mov ah, 01h
int 21h

mov bl, al   ; move A to bl register


cmp bl, 30h  ; compare bl with ascii value of 01
jge print    ; if greater or equal jump to label print

print:       ; label print

cmp bl, 39h  ; compare bl with ascii value of 09
jle print1   ; if less or equal jump to label print1
jg end       ; if greater or equal jump to label print


; new line

mov ah, 02h    ; character output function
mov dl, 0Ah    ; line feed
int 21h        ; dos interrupt
mov dl ,0Dh    ; Carriage return
int 21h        ; dos interrupt
       
print1:
mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, next
int 21h

mov ah, 09h
lea dx, msg2
int 21h
ret

end:

cmp bl, 41h
jge print2

print2:
cmp bl, 5Ah
jle print3
jge end1

print3:
mov ax, @data
mov ds, ax 

mov ah, 09h
lea dx, next
int 21h

mov ah, 09h
lea dx, msg1
int 21h
ret

end1:
mov ax, @data
mov ds, ax
 
mov ah, 09h
lea dx, next
int 21h

mov ah, 09h
lea dx, msg3
int 21h
ret


     
main endp
endp