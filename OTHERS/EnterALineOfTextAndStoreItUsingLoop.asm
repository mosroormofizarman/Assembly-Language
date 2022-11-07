.MODEL SMALL      ;Code model set to small
.STACK 100H       ;Stack memory 100H size
.DATA
    MSG DB "Enter a line of text$"
    A DB 10 DUP (?), '$';Declaration of the array inside data segment
    NEWLINE DB 0AH, 0DH, '$'
.CODE             ;Code starts from here

    START:        ;Mark start of code segment   
    MOV AX, @DATA ;DATA SEGMENT TO AX
    MOV DS, AX    ;AX TO DS
    
    MOV AH, 1     ;AH=1,Single key input 
    MOV CX, 10    ;CX store the loop count 10
    LEA SI, A     ;SI holds the offset address of A
    
    INPUT:        ;Mark input of code segment
    INT 21H       ;Take inputs
    MOV [SI], AL  ;[SI]=AL, input in [SI] 
    INC SI        ;SI=SI+1
    
    LOOP INPUT    ;When the loop instruction is executed, the ECX register is decremented and the control jumps to the target label
    
    OUTPUT:       ;Mark output of code segment
    MOV AH, 9     ;AH=9,Character String output
    LEA DX, NEWLINE;Store effective address for NEWLINE in register DX
    INT 21H       ;Print a newline
    LEA DX, A     ;Store effective address for A in register DX
    INT 21H       ;Print the line of text 
    
    Exit:         ;Mark exit of code segment
    MOV AH, 4CH   ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H       ;Invoke the instruction for interrupt where there function needs to be executed 