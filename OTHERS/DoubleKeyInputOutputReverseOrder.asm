; Write a program in assembly language that will -
;- Take 2 single-key inputs, display the inputs in reverse order.


.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    
    INPUT:      ;Mark input of code segment
    MOV AH, 1   ;AH=1,Single key input
    
    INT 21H     ;Input in AL
    MOV BH, AL  ;BH=AL, 1st input in BH
    
    INT 21H     ;Input in AL
    MOV CH, AL  ;CH=AL, 2nd input in CH
    
    
    OUTPUT:     ;Mark output of code segment
    MOV AH, 2   ;AH=2,Single key output
    
    MOV DL, CH  ;DL=CH, Display the 2nd input
    INT 21H     ;Print DL
    MOV DL, BH  ;DL=BH, Display the 1sd input
    INT 21H     ;Print DL
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed