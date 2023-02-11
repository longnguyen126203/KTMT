.MODEL small
.STACK
.DATA  
    alert1 DB "Nhap mot ky tu(hoac ESC): $"
    alert2 DB 10,13,"Ky tu da nhap la chu$"  
    alert3 DB 10,13,"Ky tu da nhap la so$"
    alert4 DB 10,13,"Ky tu da nhap khac chu/so$"   
    newline DB 10,13,"$"
    
.CODE
;----------------------------------
    MOV AX, @DATA
    MOV DS, AX
    
CallBack:
    CALL Input
    CALL Check

Input PROC
    LEA DX, alert1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
Input ENDP

Check PROC
    ;ESC
    CMP AL, 1BH
    JE Exit
    
    ;0-9
    CMP AL, 30h
    JB PrintOther
    
    CMP AL, 39H
    JBE PrintNumber
    
    ;A-Z
    CMP AL, 41h
    JB PrintOther
    
    CMP AL, 5Ah
    JBE PrintWord
    
    ;a-z
    CMP AL, 61h
    JB PrintOther
    
    CMP AL, 7Ah
    JBE PrintWord
    RET
    
Check ENDP
PrintWord:
    LEA DX, alert2
    JMP Print
     
    
PrintNumber:
    LEA DX, alert3
    JMP Print
    
    
PrintOther:
    LEA DX, alert4
    JMP Print    
    

Print:
    MOV AH, 9
    INT 21h
    
    LEA DX, newline
    MOV AH, 9
    INT 21h
    
    JMP Input
Exit:
    MOV AH, 4Ch
    INT 21h