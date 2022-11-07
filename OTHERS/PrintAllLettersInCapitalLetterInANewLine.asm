;Write a program using the Loop instruction to print all letters each in a new line as follows (must print all 26 letters): 

.MODEL SMALL            ;Code model set to SMALL
.STACK 100H             ;Stack memory 100H size
.DATA
    NEWLINE DB 0AH, 0DH, '$' ;Declaration of the newline inside data segment
.CODE                   ;Code starts from here
    START:              ;Mark start of code segment
    
    MOV AX, @DATA       ;DATA SEGMENT TO AX
    MOV DS, AX          ;AX TO DS
  
    MOV BL, 41H         ;Initial value of BL=A ASCII-41H 

    MOV CX, 26          ;Initial value of counter CX=26 for 26 Alphabets A to Z


    OUTPUT:             ;Mark output of code segment

    MOV AH, 2           ;AH=2,Single key output
    MOV DL, BL          ;DL=BL, Display current value of BL
    INT 21H             ;Print DL
    
    MOV AH, 9           ;AH=9,Character String output
    LEA DX, NEWLINE     ;Store effective address for NEWLINE in register DX
    INT 21H             ;Print a newline

    INC BL              ;Incrementing value of BL, BL=BL+1

    LOOP OUTPUT         ;Looping OUTPUT label and in each iteration CX=CX-1
    
    EXIT:
    MOV AH, 4CH         ;4CH = DOS exit function; handover the control to OS and exit program
    INT 21H             ;Invoke the instruction for interrupt where there function needs to be executed