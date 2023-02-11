.MODEL SMALL
.STACK 100
.DATA
    ALERT1 DB 13, 10, 'Nhap so thap luc phan (toi da 4 ky so): $'
    ALERT2 DB 13, 10, 'So thap luc phan da nhap: $'
    newline DB 13,10, '?'
.CODE
;Nhap so thap luc pha chua vao BX
    mov ax, @data
    mov ds, ax
    LEA DX, ALERT1
    MOV AH, 9
    INt 21h 
    
    XOR BX, BX
    MOV CL, 4 ;dich 4 bit
    MOV AH, 1
N2:
    INT 21H
    CMP AL, 13
    JE N8
    CMP AL, 39H ;ky tu la chu so
    JG Letter
    AND AL, 0FH ;doi thanh tri
    JMP Shift   ;dua vao BX
    
Letter:
    SUB AL, 37h ;doi chu ra tri
Shift:
    SHL BX, CL
    OR BL, AL
    JMP N2
N8:
    ;xuat so thap luc phan trong BX
    MOV AX, @DATA
    MOV DS, AX
    LEA DX, ALERT2
    MOV AH, 9
    INT 21H
    MOV CX, 4
    
PrintHex:
    MOV DL, BH
    SHR DL, 4
    CMP DL, 9
    JG PrintLetter
    OR DL, 30h
    MOV AH, 2
    INT 21h
    JMP Exit
    
PrintLetter:
    ADD DL, 37h
    MOV AH, 2
    INT 21h
Exit:
    SHL BX, 4
    LOOP PrintHex
    
    MOV AH, 4Ch
    INT 21h
END