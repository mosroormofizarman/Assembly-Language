;Take a user input; if the input is character 1 or 3 or 5 display ‘O’. If it is 2 or 4, display “E”. If it is anything else, do nothing. (follow example 8)

.MODEL SMALL            ;Code model set to SMALL
.STACK 100H             ;Stack memory 100H size
.CODE                   ;Code starts from here
    START:              ;Mark start of code segment
    
    MOV AH, 1           ;AH=1,Single key input

    INPUT:              ;Mark input of code segment
    INT 21H             ;Take input

    CMP AL,'1'          ;Compare input value with 1
    JE PRINT_O          ;if(input==1), goto label(line 35)
                        ;else goto next instruction(line 17)
 
    CMP AL,'3'          ;Compare input value with 3
    JE PRINT_O          ;if(input==3), goto label(line 35)
                        ;else goto next instruction(line 21)
                        
    CMP AL,'5'          ;Compare input value with 5
    JE PRINT_O          ;if(input==5), goto label(line 35)
                        ;else goto next instruction(line 25)

    CMP AL,'2'          ;Compare input value with 2
    JE PRINT_E          ;if(input==2), goto label(line 41)
                        ;else goto next instruction(line 29)
    
    CMP AL,'4'          ;Compare input value with 4
    JE PRINT_E          ;if(input==4), goto label(line 41)
                        ;else goto next instruction(line 33)
    
    JMP EXIT            ;goto exit & thus skip line 35-44

    PRINT_O:            ;Mark PRINT_O of code segment
    MOV AH, 2           ;AH=2,Single key output 
    MOV DL, 'O'         ;DL='O', Display 'O'
    INT 21H             ;Print 'O'
    JMP EXIT            ;goto exit & thus skip line 41-44
    
    PRINT_E:            ;Mark PRINT_E of code segment
    MOV AH, 2           ;AH=2,Single key output 
    MOV DL, 'E'         ;DL='E', Display 'E'
    INT 21H             ;Print 'E'

    EXIT:               ;Mark exit of code segment
    MOV AH, 4CH         ;4CH = DOS exit function; handover the control to OS and exit program
    INT 21H             ;Invoke the instruction for interrupt where there function needs to be executed