.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 9   ;AH=9
    INC AL      ;AL=AL+1=0+1=1
    DEC BL      ;BL=BL-1=0-1=FFH
    MOV BH, 5   ;BH=5
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed