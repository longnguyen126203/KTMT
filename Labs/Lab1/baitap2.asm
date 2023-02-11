.MODEL SMALL
.STACK
.DATA
    newline DB 13,10, "Nhap mot ky tu: $" 
    newline2 DB 13,10, "Ky tu da nhap: $" 
    DULIEU DB 00H
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ;hien thi cau nhac nhap
    LEA DX, newline
    MOV AH, 09H 
    INT 21H
    ;nhap mot ky tu
    MOV AH, 1
    INT 21H
    
    ;hien thi xuat ky tu
    LEA DX, newline2
    MOV AH, 09H 
    INT 21H
    ;xuat ky tu vua nhap
    MOV DL, AL
    MOV AH, 2
    MOV DL, DULIEU
    INT 21H
    
    MOV AH, 4CH
    INT 21H