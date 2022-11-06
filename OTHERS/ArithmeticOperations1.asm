.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here

    START:      ;Mark start of code segment
    MOV AH, 3   ;AH=3
    ADD AH, 4   ;AH=AH+4=3+4=7
    MOV AL, 5   ;AL=5
    SUB AH, AL  ;AH=AH-AL=7-5=2
    
    INC BL      ;BL=BL+1=0+1=1
    DEC DH      ;DH=DH-1=0-1=FFH
    
    EXIT:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit function; handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed