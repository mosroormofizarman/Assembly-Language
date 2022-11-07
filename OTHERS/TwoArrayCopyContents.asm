;Create two arrays of size 5. Load one of the arrays with random numbers of your choice. The second array should be kept blank. Copy the contents of the first array into the second array in the same order and print the array. You must not use loops to accomplish this task.


.MODEL SMALL      ;Code model set to small
.STACK 100H       ;Stack memory 100H size
.DATA
    A1 DB 5 DUP (?), '$';Declaration of the array inside data segment
    A2 DB 5 DUP (?), '$'
    NEWLINE DB 0AH, 0DH, '$'
.CODE             ;Code starts from here
 
    START:        ;Mark start of code segment   
    MOV AX, @DATA ;DATA SEGMENT TO AX
    MOV DS, AX    ;AX TO DS           
    
    INPUT:        ;Mark input of code segment
    MOV AH, 1     ;AH=1,Single key input
    
    INT 21H       ;Input in AL
    MOV A1[0], AL ;A1[0]=AL, 1st input in A1[0]
    
    INT 21H       ;Input in AL
    MOV A1[1], AL ;A1[1]=AL, 2nd input in A1[1]
    
    INT 21H       ;Input in AL
    MOV A1[2], AL ;A1[2]=AL, 3rd input in A1[2]
    
    INT 21H       ;Input in AL
    MOV A1[3], AL ;A1[3]=AL, 4th input in A1[3]
    
    INT 21H       ;Input in AL
    MOV A1[4], AL ;A1[4]=AL, 5th input in A1[4]
    
    OUTPUT:       ;Mark output of code segment
    MOV AH, 9     ;AH=9,Character String output
    LEA DX, NEWLINE;Store effective address for NEWLINE in register DX
    INT 21H       ;Print a newline
    
    MOV AH, 2     ;AH=2,Single key output
    
    MOV DL, A1[0] ;DL=A1[0], Display the 1st input A1[0]  
    MOV A2[0], DL ;A2[0]=DL=A1[0]
    INT 21H       ;Print DL 
    
    MOV DL, A1[1] ;DL=A1[1], Display the 2nd input A1[1]
    MOV A2[1], DL ;A2[1]=DL=A1[1]     
    INT 21H       ;Print DL 
    
    MOV DL, A1[2] ;DL=A1[2], Display the 3rd input A1[2]
    MOV A2[2], DL ;A2[2]=DL=A1[2]     
    INT 21H       ;Print DL 
    
    MOV DL, A1[3] ;DL=A1[3], Display the 4th input A1[3]
    MOV A2[3], DL ;A2[3]=DL=A1[3]      
    INT 21H       ;Print DL 
    
    MOV DL, A1[4] ;DL=A1[4], Display the 5th input A1[4]      
    MOV A2[4], DL ;A2[4]=DL=A1[4]      
    INT 21H       ;Print DL      
    
    
    Exit:         ;Mark exit of code segment
    MOV AH, 4CH   ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H       ;Invoke the instruction for interrupt where there function needs to be executed