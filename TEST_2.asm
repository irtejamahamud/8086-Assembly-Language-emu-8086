INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA
  firstname DB "irteja"
  lastname DB "mahmud"
  fullname DB 50 DUP(?)

.CODE

MAIN PROC
  MOV AX,@DATA
  MOV DS,AX
 

  MOV SI,0
  MOV DI,0
 
  CONT1:
    MOV DL,firstname[SI]      
    MOV fullname[DI],DL
    INC SI
    INC DI
    CMP DL,0
    JE TEMP
    JNE CONT1
   
  TEMP:
    DEC DI
    MOV SI,0
    MOV fullname[DI],'_'
    INC DI
    JMP CONT2
   
  CONT2:
    MOV DL,lastname[SI]
    MOV fullname[DI],DL
    INC SI
    INC DI
    CMP DL,0
    JE PRINT_NEW
    JNE CONT2
   
  PRINT_NEW:
    PRINT 'TESTING C: '
    LEA SI,fullname
    CALL PRINT_STRING
    PRINTN ''
 
  EXIT:
    MOV AH,04CH
    INT 21H
 
MAIN ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_GET_STRING
DEFINE_PRINT_STRING

END MAIN