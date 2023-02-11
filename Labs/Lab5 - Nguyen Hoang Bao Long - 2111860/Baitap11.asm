.MODEL SMALL 
.STACK 100
.DATA
    END1 DB 13,10,10,'Bam mot phim bat ki de thoat chuong trinh: $'
    
    MSG1 DB 13,10, 'Nhap so thu nhat: $'
    MSG2 DB 13,10, 'Nhap so thu hai: $'
    RES1 DB 13,10, 'Ket qua cua phep chia: $'
    RES2 DB 13,10, 'Phan thuong la: $'
    RES3 DB 13,10, 'Phan du la: $'
    
    NUM1 DW ?
    NUM2 DW ?
    
.CODE
    ;KHOI TAO CHUONG TRINH
    CALL KHOI_TAO_CHUONG_TRINH
    
    ;Xuat thong bao nhap so thu nhat
    MOV DX, OFFSET MSG1
    CALL XUAT_CHUOI
    
    ;Nhap so thu nhat
    CALL NHAP_THAP_PHAN
    MOV NUM1, BX
    
    ;Xuat thong bao nhap so thu hai
    MOV DX, OFFSET MSG2
    CALL XUAT_CHUOI
    
    ;Nhap so thu hai 
    CALL NHAP_THAP_PHAN
    MOV NUM2, BX
    
    ;Xuat thong bao ket qua
    MOV DX, OFFSET RES1
    CALL XUAT_CHUOI
    MOV AX, NUM1
    CALL XUAT_THAP_PHAN
    
    MOV AH, 2
    MOV DL, '/'
    INT 21H
    
    MOV AX, NUM2
    CALL XUAT_THAP_PHAN
    
    ;Chia 2 so
    XOR DX, DX
    MOV AX, NUM1
    MOV CX, NUM2
    DIV CX
    
    MOV BX, AX ;Phan thuong luu o BX
    MOV CX, DX ;Phan du luu o CX
    
    ;Xuat ket qua phan thuong voi phan du
    MOV DX, OFFSET RES2
    CALL XUAT_CHUOI
    
    MOV AX, BX
    CALL XUAT_THAP_PHAN
    
    MOV DX, OFFSET RES3
    CALL XUAT_CHUOI 
    
    MOV AX, CX
    CALL XUAT_THAP_PHAN
    
    
    
    ;XUAT CHUOI
    XUAT_CHUOI PROC
        PUSH AX
        PUSH DX
        
        MOV AH, 9
        INT 21H
        
        POP AX
        POP DX
        RET
    XUAT_CHUOI ENDP
    
    
    ;THU TUC KHOI TAO CHUONG TRINH
    KHOI_TAO_CHUONG_TRINH PROC
        MOV AX, @DATA
        MOV DS, AX
        
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX
        RET
    KHOI_TAO_CHUONG_TRINH ENDP 
    
    
    ;THU TUC NHAP THAP PHAN
    ;INTPUT: KHONG
    ;OUTPUT:
    ;     -BX: SO THAP PHAN TU BAN PHIM
    NHAP_THAP_PHAN PROC
        PUSH AX
        PUSH CX
        PUSH DX
        
        XOR BX, BX
        
        INPUT:
            MOV AH, 7
            INT 21H
            
            CMP AL, 0DH
            JE EXIT1
            
            CMP AL, '0'
            JB XULY_LOI
            CMP AL, '9'
            JA XUlY_LOI
            
            MOV CL, AL
            
            MOV AH, 2
            MOV DL, CL
            INT 21H 
            
            AND CL, 0FH ;CHUYEN TRI THANH SO
            
            MOV AX, BX
            MOV DX, 10
            MUL DX
            
            MOV BX, AX
            XOR CH, CH
            ADD BX, CX
            
            XULY_LOI:
            JMP INPUT
            
        EXIT1:
            POP AX
            POP CX
            POP DX
     
            RET
    NHAP_THAP_PHAN ENDP
    
    XUAT_THAP_PHAN PROC
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        
        MOV BX, 10
        XOR CX, CX
        
        XULY_STACK:
            XOR DX, DX
            DIV BX
            PUSH DX
            INC CX
            
            CMP AX, 0
            JA XULY_STACK
            
        PRINT:
            POP DX
            OR DX, 30H
            MOV AH, 2
            INT 21H
            LOOP PRINT
        POP DX
        POP CX
        POP BX
        POP AX
    XUAT_THAP_PHAN ENDP
    
    ;THU TUC DUNG VA THOAT CHUONG TRINH
    THOAT_CHUONG_TRINH PROC
        MOV AH, 9
        LEA DX, END1
        INT 21H
        
        MOV AH, 7
        INT 21H
        
        MOV AH, 4CH
        INT 21H
     THOAT_CHUONG_TRINH ENDP
END