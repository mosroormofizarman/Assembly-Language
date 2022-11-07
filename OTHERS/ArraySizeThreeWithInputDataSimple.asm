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
    
    INT 21H     ;Input in AL
    MOV A[0], AL;A[0]=AL, 1st input in A[0]
    
    INT 21H     ;Input in AL
    MOV A[1], AL;A[1]=AL, 2nd input in A[1]
    
    INT 21H     ;Input in AL
    MOV A[2], AL;A[2]=AL, 3rd input in A[2]
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed