output macro msg
    mov ah, 09h
    lea dx, msg
    int 21h
endm                  


input macro char
    mov ah, 01h
    int 21h
    mov char,al
endm 


vowelcheck macro char  
    
    mov al,char
    
    cmp al, 'A'
    je vowel
    cmp al, 'E'
    je vowel
    cmp al, 'I'
    je vowel
    cmp al, 'O'
    je vowel
    cmp al, 'U'
    je vowel
    cmp al, 'a'
    je vowel
    cmp al, 'e'
    je vowel
    cmp al, 'i'
    je vowel
    cmp al, 'o'
    je vowel
    cmp al, 'u'
    je vowel

    output constmsg 
     jmp exit

    vowel:
     output vowelmsg 
    
 
    exit:
    mov ah, 4ch
    int 21h  
    
    ret
    
endm
  

org 100h
.model small

.data 
  char db ?
  inputmsg db 10,13,"Enter a Character: $"
  vowelmsg db 10,13,"Vowel$"
  constmsg db 10,13,"Constant$"

.code
main proc
    mov ax, @data
    mov ds, ax


    output inputmsg

    input char

    vowelcheck char


ret

main endp
end main