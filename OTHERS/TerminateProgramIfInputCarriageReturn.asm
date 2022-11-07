.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 1   ;AH=1,Single key input
    MOV CX, 10  ;CX store the loop count 10 
    
    INPUT:      ;Mark input of code segment
    INT 21H     ;Take inputs
    
    
    CMP AL, 0DH ;Check if input is ASCII value for carriage return
    JE EXIT     ;goto label(line 19)
    
    DEC CX      ;CX=CX-1
    JNZ INPUT   ;if CX not zero, then goto label(line 09)
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed