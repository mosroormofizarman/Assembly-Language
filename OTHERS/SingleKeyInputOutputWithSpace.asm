; Write a program in assembly language that will -
;- Take 1 single-key input
;- Display a space on screen after the input (Hint: ASCII value for ‘space’ is 20h)
;- Display the input taken earlier using the single-key output function


.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    
    INPUT:      ;Mark input of code segment
    MOV AH, 1   ;AH=1,Single key input
    INT 21H     ;Input in AL
    MOV BL, AL  ;BL=AL, Input in BL
    
    OUTPUT:     ;Mark output of code segment
    MOV AH, 2   ;AH=2,Single key output
     
    MOV DL, 020H;DL=020H, ASCII for space
    INT 21H     ;Print DL
    
    MOV DL, BL  ;DL=BL,Display the input 
    INT 21H     ;Print DL
    
    
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed