;Define a string with lower-case characters and print it in uppercase characters

.MODEL SMALL      ;Code model set to small
.STACK 100H       ;Stack memory 100H size
.DATA
    A DB 5 DUP (?), '$';Declaration of the array inside data segment
    NEWLINE DB 0AH, 0DH, '$'
.CODE             ;Code starts from here
 
    START:        ;Mark start of code segment   
    MOV AX, @DATA ;DATA SEGMENT TO AX
    MOV DS, AX    ;AX TO DS           
    
    INPUT:        ;Mark input of code segment
    MOV AH, 1     ;AH=1,Single key input
    
    INT 21H       ;Input in AL
    MOV A[0], AL  ;A[0]=AL, 1st input in A[0]
    
    INT 21H       ;Input in AL
    MOV A[1], AL  ;A[1]=AL, 2nd input in A[1]
    
    INT 21H       ;Input in AL
    MOV A[2], AL  ;A[2]=AL, 3rd input in A[2]
    
    INT 21H       ;Input in AL
    MOV A[3], AL  ;A[3]=AL, 4th input in A[3]
    
    INT 21H       ;Input in AL
    MOV A[4], AL  ;A[4]=AL, 5th input in A[4]
    
    OUTPUT:       ;Mark output of code segment
    MOV AH, 9     ;AH=9,Character String output
    LEA DX, NEWLINE;Store effective address for NEWLINE in register DX
    INT 21H       ;Print a newline
    
    MOV AH, 2     ;AH=2,Single key output
    
    SUB A[0], 020H;Subtracting 020H from each char so we get ascii for upper case
    MOV DL, A[0]  ;DL=A[0], Display the 1st input A[0]
    INT 21H       ;Print DL
    
    SUB A[1], 020H;convert it to upper case
    MOV DL, A[1]  ;DL=A[1], Display the 2nd input A[1]
    INT 21H       ;Print DL
    
    SUB A[2], 020H;convert it to upper case
    MOV DL, A[2]  ;DL=A[2], Display the 3rd input A[2]
    INT 21H       ;Print DL
    
    SUB A[3], 020H;convert it to upper case
    MOV DL, A[3]  ;DL=A[3], Display the 4th input A[3]
    INT 21H       ;Print DL
    
    SUB A[4], 020H;convert it to upper case
    MOV DL, A[4]  ;DL=A[4], Display the 5th input A[4]
    INT 21H       ;Print DL        
    
    
    Exit:         ;Mark exit of code segment
    MOV AH, 4CH   ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H       ;Invoke the instruction for interrupt where there function needs to be executed