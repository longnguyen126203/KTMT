.MODEL SMALL
.STACK
.DATA
    newline DB 0Ah, 0DH, "Nhap ki tu thu nhat: $" 
    newline1 DB  0Ah, 0DH, "Nhap ki tu thu hai: $"
    newline2 DB 13,10, "Ky tu tong: $"   
    DULIEU1 DB 00H
    DULIEU2 DB 00H
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    
    MOV AH, 1
    INT 21H 
    MOV DULIEU1, AL   
     
    LEA DX, newline1
    MOV AH, 09H
    INT 21H 
      
    MOV AH, 1
    INT 21H 
    MOV DULIEU2, AL   
     
    LEA DX, newline2
    MOV AH, 09H
    INT 21H
    
    MOV DL, DULIEU1
    ADD DL, DULIEU2
    MOV AH, 2
    INT 21H 
    
    MOV AH, 4CH
    INT 21H