.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 13,10, 'Nhap so thu nhat: $'
    MSG2 DB 13,10, 'Nhap so thu hai: $'
    
    RES1 DB 13,10, 'Tong: $'
    RES2 DB 13,10, 'Hieu: $'
    RES3 DB 13,10, 'Tich: $'
    RES4 DB 13,10, 'Thuong: $'
    
    NUM1 DW ?
    NUM2 DW ?
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ;NHAP SO THU NHAT
    INPUT_1:
        MOV DX, OFFSET MSG1
        CALL XUAT_CHUOI
    
        CALL NHAP_THAP_PHAN
        CMP DX, 0
        JE INPUT_1
        
     MOV NUM1, BX
        
     ;NHAP SO THU HAI
     INPUT_2: 
        MOV DX, OFFSET MSG2
        CALL XUAT_CHUOI
        
        CALL NHAP_THAP_PHAN
        CMP DX, 0
        JE INPUT_2
        
      MOV NUM2, BX
      
      ;XUAT TONG
      MOV DX, OFFSET RES1
      CALL XUAT_CHUOI
      
      MOV AX, NUM1
      MOV AX, NUM2
      ADD AX, BX
      CALL XUAT_THAP_PHAN
      
      ;XUAT HIEU 
      MOV DX, OFFSET RES2
      CALL XUAT_CHUOI
      
      MOV AX, NUM1
      MOV AX, NUM2
      SUB AX, BX
      MOV CX, AX
      
      JS XUAT_AM
      JMP XUAT_KQ
      
      XUAT_AM:
          MOV AH, 2
          MOV DL, '-'
          INT 21H
          
          NEG CX
          MOV AX, CX
          
      XUAT_KQ:
        CALL XUAT_THAP_PHAN
      
       ; Xuat tich
        MOV DX, OFFSET RES3
        CALL XUAT_CHUOI
        
        MOV AX, NUM1
        MOV BX, NUM2
        MUL BX    
        CALL XUAT_THAP_PHAN
        
       ; Xuat thuong
        MOV DX, OFFSET RES4
        CALL XUAT_CHUOI
            
        XOR DX, DX
        MOV AX, NUM1
        MOV BX, NUM2
        DIV BX
        CALL XUAT_THAP_PHAN
        
        MOV AH, 4CH
        INT 21H
        
        XUAT_CHUOI PROC
            PUSH AX
            MOV AH, 9
            INT 21H
            POP AX
            RET 
        XUAT_CHUOI ENDP
        
        NHAP_THAP_PHAN PROC
            PUSH AX
            PUSH CX
            PUSH SI
            
            INTPUT:
                MOV AH, 1
                INT 21H
                
                CMP AL, 0DH
                JE BREAK
                
                CMP AL, '0'
                JB XULY_LOI
                CMP AL, '9'
                JA XULY_LOI
                
                AND AL, 0FH
                MOV CL, AL
                XOR CH, CH
                
                MOV AX, BX
                MOV SI, 10
                MUL SI
                MOV BX, AX
                ADD BX, CX
                
                JMP INTPUT
                
                XULY_LOI:
                    XOR BX, BX
                    MOV DX, 0
                    JMP EXIT
            BREAK:
                MOV DX, 1
                
            EXIT:
                POP SI
                POP CX
                POP AX
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
END