.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 1   ;AH=1,Single key input
    MOV CX, 10  ;CX store the loop count 10 
    
    INPUT:      ;Mark input of code segment
    INT 21H     ;Take inputs
    
    
    CMP AL, 31H ;Check if input is the ASCII code for '1'
    JE PRINT_O  ;if(input==1), goto label(line 22), else goto next instruction(line 16) 
    
    CMP AL, 32H ;Check if input is the ASCII code for '2'
    JE PRINT_E  ;if(input==2), goto label(line 28), else goto next instruction(line 20) 
    
    
    JMP EXIT    ;goto exit & thus skip line 22-31 
    
    PRINT_O:
    MOV AH, 2   ;AH=2,Single key output 
    MOV DL, 'O' ;DL='O', Display 'O'
    INT 21H     ;Print 'O'
    JMP EXIT    ;goto exit & thus skip line 28-31
    
    PRINT_E:
    MOV AH, 2   ;AH=2,Single key output 
    MOV DL, 'E' ;DL='E', Display 'E'
    INT 21H     ;Print 'E' 
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed