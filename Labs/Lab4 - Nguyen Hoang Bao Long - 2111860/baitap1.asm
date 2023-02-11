.MODEL SMALL
.STACK 100
.DATA
    TB DB "?"
    MSG DB 13, 10, 'Chuoi da dao nguoc: $'
.CODE
;----------------------------
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX   ;KHOI TAO THANH GHI DS
        
        ;NHAP CHUOI KI TU 
        LEA DX, TB
        MOV AH, 10
        INT 21H
        
        ;IN CHUOI THONG BAO RA MAN HINH
        LEA DX, TB
        MOV AH, 9 
        INT 21H
        
        MOV CL, [TB + 1]  ;CHUYEN CHIEU DAI CHUOI VUA NHAP VAO CL
        LEA SI, [TB + 2]  ;DUA SI VE PHAN TU THU 2 CUA MANG LA KY TU
        
        Repeal1:
                PUSH [SI] ;DUA PHAN TU TU MANG SI VAO DAU NGAN XEP
                INC SI
                LOOP Repeal1
                MOV CL, [TB + 1] ;Chuyen chieu dai chuoi vua nhap vao CL
        Repeal2:
                POP DX ;Lay gia tri tren dinh ngan xep dua vao dx
                MOV AH, 2
                INT 21h
                LOOP Repeal2
                
        MOV AH, 4Ch
        INT 21h
    MAIN ENDP
END