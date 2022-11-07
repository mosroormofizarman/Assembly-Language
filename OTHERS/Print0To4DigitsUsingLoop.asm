.MODEL SMALL    ;Code model set to small
.STACK 100H     ;Stack memory 100H size
.CODE           ;Code starts from here
 
    START:      ;Mark start of code segment
    MOV AH, 2   ;AH=2,Single key output 
    MOV CX, 5   ;CX store the loop count 5
    MOV DL, 030H;Display DL=030H=48='0'(Zero)
    
    OUTPUT:     ;Mark output of code segment
    INT 21H     ;Print '0' to '4'
    INC DL      ;DL=DL+1
    
    LOOP OUTPUT ;When the loop instruction is executed, the ECX register is decremented and the control jumps to the target label
      
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H     ;Invoke the instruction for interrupt where there function needs to be executed