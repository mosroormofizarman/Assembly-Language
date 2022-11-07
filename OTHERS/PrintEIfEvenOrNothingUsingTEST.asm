.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 1   ;AH=1,Single key input
    
    INPUT:      ;Mark input of code segment
    INT 21H     ;Take input
    
    TEST AL, 1  ;Check if LSB is zero
    
    JZ PRINT_E  ;goto label(line 17)    
    
    JMP EXIT    ;if not even, goto exit & thus skip line 17-20 
    
    PRINT_E:    ;Mark PRINT_E of code segment
    MOV AH, 2   ;AH=2,Single key output 
    MOV DL, 'E' ;DL='E', Display 'E'
    INT 21H     ;Print 'E' 
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed