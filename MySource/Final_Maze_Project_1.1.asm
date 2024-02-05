INCLUDE "emu8086.inc"
name "ESCAPE PLAN"


map1 macro
     
CALL CLEAR_SCREEN

pmaz1:
lea si,m1 
call print 
 

pmaz2:
lea si,m2
call print


pmaz3:
lea si,m3
call print


pmaz4:
lea si,m4
call print


pmaz5:
lea si,m5
call print


pmaz6:
lea si,m6
call print


pmaz7:
lea si,m7
call print


pmaz8:
lea si,m8
call print


pmaz9:
lea si,m9
call print


pmaz10:
lea si,m10
call print 


pmaz11:
lea si,m11
call print


pmaz12:
lea si,m12
call print


pmaz13:
lea si,m13
call print


pmaz14:
lea si,m14
call print


pmaz15:
lea si,m15
call print


pmaz16:
lea si,m16
call print


pmaz17:
lea si,m17
call print


pmaz18:
lea si,m18
call print


pmaz19:
lea si,m19
call print


pmaz20:
lea si,m20
call print


endd:
             
jmp game_loop 

print:
mov cx, 20

wall1:
     cmp [si], 0 
     je p1                        ;
     
     PUTC    219     ;wall 
     jmp nx1

p1:  PUTC    32      ;blank space   

nx1: inc si

loop wall1

PRINTN
ret
    
endm

map2 macro                      ;map2
 CALL CLEAR_SCREEN

pn1:
lea si,n1
call print1 

pn2:
lea si,n2
call print1

pn3:
lea si,n3
call print1

pn4:
lea si,n4
call print1

pn5:
lea si,n5
call print1

pn6:
lea si,n6
call print1

pn7:
lea si,n7
call print1

pn8:
lea si,n8
call print1

pn9:
lea si,n9
call print1

pn10:
lea si,n10
call print1 

pn11:
lea si,n11
call print1

pn12:
lea si,n12
call print1

pn13:
lea si,n13
call print1

pn14:
lea si,n14
call print1

pn15:
lea si,n15
call print1

pn16:
lea si,n16
call print1

pn17:
lea si,n17
call print1

pn18:
lea si,n18
call print1

pn19:
lea si,n19
call print1

pn20:
lea si,n20
call print1

endd1:
             
jmp game_loop 

print1:
mov cx, 20

wall11:
     cmp [si], 0 
     je p2                        ;
     
     PUTC    219     ;wall 
     jmp nx2

p2:  PUTC    32      ;blank space   

nx2: inc si

loop wall11

PRINTN
ret
   
    
endm 


org     100h
.data
  a dw 0
  b dw 0
  aal dw 0 
  c dw 0
  d dw 0

s_size  equ     2

maze dw s_size dup(0)

star    dw      ?

left    equ     4bh
right   equ     4dh
up      equ     48h
down    equ     50h

cur_dir db      right

wait_time dw    0 
keypress dw 0

msg db "WELCOME GAMER!", 0dh,0ah
	db "ESCAPE THE TRAP IN MINIMUM NUMBER OF MOVE", 0dh,0ah
	db "GAME RULES:", 0dh,0ah
	db "1.USE ARROW KEYS FOR MOVEMENT AROUND THE BOARD.", 0dh,0ah, 0ah
	
	db "2.YOU ARE REPRESENTED AS THE SMILE SYMBOL AND TRY TO GET OUT OF THE TRAP BY PLAYING OVER THE ARROW KEYS. ", 0dh,0ah
	
	
	db "LET THE GAME BEGIN :D  ", 0dh,0ah	
	db "3..2..1..ROCK!!", 0dh,0ah, 0ah
	
	db "Chose A Map (1/2): $"
	;db "====================", 0dh,0ah, 0ah

   maz1  DB 20 dup(?) 
   maz2  DB 20 dup(?)
   maz3  DB 20 dup(?)
   maz4  DB 20 dup(?)
   maz5  DB 20 dup(?)
   maz6  DB 20 dup(?)
   maz7  DB 20 dup(?)
   maz8  DB 20 dup(?)
   maz9  DB 20 dup(?)
   maz10 DB 20 dup(?)
   maz11 DB 20 dup(?)
   maz12 DB 20 dup(?)
   maz13 DB 20 dup(?)
   maz14 DB 20 dup(?)
   maz15 DB 20 dup(?)
   maz16 DB 20 dup(?)
   maz17 DB 20 dup(?)
   maz18 DB 20 dup(?)
   maz19 DB 20 dup(?)
   maz20 DB 20 dup(?)
     
         
   m1  DB  0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
   m2  DB  1,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1
   m3  DB  1,0,1,0,0,0,0,1,1,0,0,0,1,1,0,1,0,1,0,1
   m4  DB  1,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,1,0,1
   m5  DB  1,0,0,0,0,1,0,1,1,0,1,1,0,0,0,1,1,1,0,1
   m6  DB  1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1
   m7  DB  1,1,0,0,0,0,0,1,1,0,1,1,0,1,0,0,0,0,0,1
   m8  DB  1,1,0,1,1,1,0,1,1,0,1,1,0,0,0,1,1,1,1,1
   m9  DB  1,0,0,1,0,1,0,0,0,0,1,1,0,1,0,0,0,0,0,1
   m10 DB  1,0,1,1,0,1,0,1,0,0,1,1,1,1,1,1,1,1,0,1
   m11 DB  1,0,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,1,0,1
   m12 DB  1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1
   m13 DB  1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1
   m14 DB  1,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,1
   m15 DB  1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1
   m16 DB  1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1
   m17 DB  1,1,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1
   m18 DB  1,1,0,1,1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0
   m19 DB  1,1,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,1,3,1
   m20 DB  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 
   
   
   n1  DB  0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
   n2  DB  1,0,0,0,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1
   n3  DB  1,0,1,0,0,0,0,1,1,0,0,0,1,1,0,1,0,1,0,1
   n4  DB  1,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,1,0,1
   n5  DB  1,0,0,0,0,1,0,1,1,0,1,1,0,0,0,1,1,1,0,1
   n6  DB  1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1
   n7  DB  1,1,0,0,0,1,1,1,1,0,1,1,0,1,0,0,0,0,0,1
   n8  DB  1,1,0,1,0,1,0,1,1,0,1,1,0,0,0,1,1,1,1,1
   n9  DB  1,0,0,1,0,1,0,0,0,0,1,1,0,1,0,0,0,0,0,1
   n10 DB  1,0,1,1,0,1,0,1,0,0,1,1,1,1,1,1,1,1,0,0
   n11 DB  1,0,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,1,0,1
   n12 DB  1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,0,1
   n13 DB  1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1
   n14 DB  1,1,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,1
   n15 DB  1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,1
   n16 DB  1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1
   n17 DB  1,1,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1
   n18 DB  1,1,0,1,1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,1
   n19 DB  1,1,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,1,3,1
   n20 DB  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1



  DEFINE_SCAN_NUM
  DEFINE_PRINT_STRING
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS 
  DEFINE_PTHIS
  DEFINE_CLEAR_SCREEN         
  
.code
start:

mov dx, offset msg
mov ah, 9 
int 21h

mov ah,1
int 21h 
sub al,48S

cmp al,1
je callmap1
jg callmap2

callmap1:
map1

callmap2:
map2

start1:           

mov ah, 1
mov ch, 2bh
mov cl, 0bh
int 10h           

game_loop:                  

mov al, 0  
mov ah, 05h
int 10h

mov dx, maze[0]

mov ah, 02h
int 10h

mov al, 01
mov ah, 09h
mov bl, 0eh 
mov cx, 1   
int 10h

mov ax, maze[s_size * 2 - 2]
mov star, ax

call check_for_key
call no_key

gg:
; call move_maze

mov dx, star

mov ah, 02h
int 10h

mov al, 04
mov ah, 09h
mov bl, 0eh 
mov cx, 1  
int 10h

check_for_key:

mov ah, 01h
int 16h
jz no_key

mov ah, 00h
int 16h

cmp al, 1bh   
je stop_game  

mov cur_dir, ah

jmp gg
no_key:

mov ah, 00h
int 1ah
cmp dx, wait_time
jb  check_for_key
add  dx, 4
mov  wait_time, dx
   
   jmp game_loop

stop_game:

mov ah, 1
mov ch, 0bh
mov cl, 0bh
int 10h

ret