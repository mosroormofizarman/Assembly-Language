.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 0BBH;AH=0BBH 
    MOV BH, 3   ;BH=3
    ADD AH, BH  ;AH=AH+BH=0BBH+3=0BEH
    MOV BL, AH  ;BL=AH=0BEH
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed