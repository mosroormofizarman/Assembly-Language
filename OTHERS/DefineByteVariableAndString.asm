.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.DATA
    V1 DB 035H   ;Declaration of the variable inside data segment
    S DB "HELLO!$"
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment   
    MOV AX, @DATA;DATA SEGMENT TO AX
    MOV DS, AX  ;AX TO DS
    
    OUTPUT:     ;Mark output of code segment
    MOV AH, 2   ;AH=2,Single key output 
    MOV DL, V1  ;DL=V1=035H=53='5', Display the input of variable
    INT 21H     ;Print DL
    
    MOV DL, 020H;DL=020H, ASCII for space
    INT 21H     ;Print DL
    
    MOV AH, 9   ;AH=9,Character String output
    LEA DX, S   ;Store effective address for S in register DX 
    INT 21H     ;Print the string
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed