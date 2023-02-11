.MODEL SMALL
.STACK
.DATA
    CR EQU 13
    LF EQU 10
    MSG1 DB 'Nhap so nhi phan (toi da 16 bit): $'
    MSG2 DB CR, LF, 'So nhi phan da nhap :$'
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    MOV AH, 1
N2:
    INT 21H
    CMP AL, CR  
    JE N8       ;so sanh cau lenh cmp neu bang nhay den he 8
    AND AL, 0FH ;chuyen ki tu thanh so ('0'=30h, '1'=31h)
    SHL BX, 1   ;dich sang trai 1 bit
    OR BL, AL   ;sau khi chuyen ki thanh so hop bl va al lai.
    JMP N2      ;thanh cong thuc hien lai vong lap tu he nhi phan
N8:
    MOV CX, 16  ;gan thanh ghi CX voi 16 bit
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    PrintLoop:
        ROL BX, 1  ;dich chuyen tat ca cac gia tri co trong thanh ghi BX khi duoc chuyen sang trai 1 
        JC Print1  ;short jump neu CF bat len khi gia tri do = 256 
        MOV DL, '0';gan thanh ghi BX bat dau la so 0
        MOV AH, 2
        INT 21H
        JMP Exit1  ;thanh cong thi thoat
    Print1:
        MOV DL, '1';gan thanh ghi BX bat dau la so 1
        MOV AH, 2
        INT 21H
    Exit1:
        DEC CX     ;luc dau co 16 bit sau khi thuc hien vong lap se tru di 1
        CMP CX, 0  ;so sanh thanh ghi CX voi so 0
        JNE PrintLoop ;nhay voi gia tri khac voi printloop
        
    MOV AH, 4CH
    INT 21H 
END