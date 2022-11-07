;Read a character and check if the input contains an even number. If it is even, print 'e' and if it's an odd number print 'o' 

.MODEL SMALL            ;Code model set to SMALL
.STACK 100H             ;Stack memory 100H size
.CODE                   ;Code starts from here
    START:              ;Mark start of code segment    

    MOV AH, 1           ;AH=1,Single key input

    INPUT:              ;Mark input of code segment
    INT 21H             ;Take input

    TEST AL, 1          ;Checks if LSB is zero
    MOV BL, 2           ;BL=2
                        
    JZ PRINT_e          ;goto label(line 26)

    JMP PRINT_o         ;if not even, goto label(line 20)

    PRINT_o:            ;Mark PRINT_o of code segment
    MOV AH, 2           ;AH=2,Single key output
    MOV DL, 'o'         ;DL='o', Display 'o'
    INT 21H             ;Print 'o'
    JMP EXIT            ;goto exit & thus skip line 26-29

    PRINT_e:            ;Mark PRINT_e of code segment
    MOV AH, 2           ;AH=2,Single key output
    MOV DL, 'e'         ;DL='e', Display 'e'
    INT 21H             ;Print 'e'

    EXIT:               ;Mark exit of code segment
    MOV AH, 4CH         ;4CH = DOS exit function; handover the control to OS and exit program
    INT 21H             ;Invoke the instruction for interrupt where there function needs to be executed