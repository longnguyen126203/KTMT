.MODEL small
.STACK 100
.DATA
    alert1 DB "Nhap 1 ky tu(ESC): $"    
    alert2 DB 10,13,"Ky tu vua nhap: $"
    alert3 DB 10,13,"Ky tu khong phu hop$"
    
    newline DB 10,13,"$"
    
    i DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX

CallBack:
    CALL Input

    CALL Check

Input PROC
    LEA DX,alert1
    MOV AH,9
    INT 21h
            
    MOV AH,1
    INT 21h
    
    MOV i,AL
    
Input ENDP

Check PROC
    ;ESC
    CMP AL,27
    JE Exit
    
    CMP AL,33  ;21h
    JAE Compare 
    
    JMP Output2
    RET
Check ENDP


Compare:
    CMP AL,254 ;FEh      
    JBE Output1
    JMP Output2
    
Output1:
    LEA DX,alert2
    MOV AH,9
    INT 21h
    
    MOV DL,i
    MOV AH,2
    INT 21h
    JMP Exit
    
Output2:   
    LEA DX,alert3
    MOV AH,9
    INT 21h
    
    LEA DX,newline
    MOV AH,9
    INT 21h
    
    JMP Input

Exit:       
    MOV AH,4ch
    INT 21h