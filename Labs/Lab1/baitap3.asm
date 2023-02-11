.MODEL SMALL
.STACK
.DATA
    newline DB 0Ah, 0DH, "Ki tu da nhap la: $" 
    newline1 DB  0Ah, 0DH, "Ky tu dung truoc: $"
    newline2 DB ", da nhap: $"
    newline3 DB ", dung sau: $"   
    DULIEU DB 00H
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    
    
    MOV AH, 1
    INT 21H 
    MOV DULIEU, AL   
     
    LEA DX, newline1
    MOV AH, 09H
    INT 21H 
     
    MOV AH, 2
    MOV DL, DULIEU
    DEC DL
    INT 21H
    
    LEA DX, newline2
    MOV AH, 09H
    INT 21H 
    
     
    MOV AH, 2 
    MOV DL, DULIEU
    INT 21H
    
    LEA DX, newline3
    MOV AH, 09H
    INT 21H
     
    MOV AH, 2 
    MOV DL, DULIEU
    INC DL
    INT 21H
    RET


    MOV AH, 4CH
    INT 21H