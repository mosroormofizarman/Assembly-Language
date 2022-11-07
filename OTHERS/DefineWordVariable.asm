.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.DATA
    V1 DW 054H   ;Declaration of the variable inside data segment
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment   
    MOV AX, @DATA;DATA SEGMENT TO AX
    MOV DS, AX  ;AX TO DS
    
    OUTPUT:     ;Mark output of code segment
    MOV AH, 2   ;AH=2,Single key output 
    MOV DX, V1  ;DX=V1=054H=84='T', Display the input of variable
    INT 21H     ;Print DX
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed