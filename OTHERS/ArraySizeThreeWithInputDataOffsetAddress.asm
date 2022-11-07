.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.DATA
    A DB 3 DUP (?), '$';Declaration of the array inside data segment
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment   
    MOV AX, @DATA;DATA SEGMENT TO AX
    MOV DS, AX  ;AX TO DS           
    
    INPUT:      ;Mark input of code segment
    MOV AH, 1   ;AH=1,Single key input
    
    LEA SI, A   ;SI holds the offset address of A
    
    INT 21H     ;Input in AL
    MOV [SI], AL;[SI]=AL, 1st input in [SI]
    
    INT 21H     ;Input in AL
    MOV [SI+1], AL;[SI+1]=AL, 2nd input in [SI+1]
    
    INT 21H     ;Input in AL
    MOV [SI+2], AL;[SI+2]=AL, 3rd input in [SI+2]
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed