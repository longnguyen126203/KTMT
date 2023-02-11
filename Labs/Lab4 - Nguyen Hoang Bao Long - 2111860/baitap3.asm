.MODEL small
.STACK 200
.DATA
    i DB ?
    alert1 DB "Nhap ky tu(a-z): $"
    alert2 DB 10,13,"Ky tu sau khi chuyen: $"
    alert3 DB 10,13,"Ky tu da nhap phai la cac ky tu thuong$"
    newline DB 10,13,"$" 
.CODE
    MOV AX,@DATA
    MOV DS,AX

CallBack:
    CALL Input 
    
    CALL Check

Input PROC   

    LEA DX, alert1
    MOV AH, 9
    INT 21h 

    MOV AH, 1
    INT 21h
    
    MOV i, AL

Input ENDP 

Check PROC
                   
    CMP AL, 97
    JB PrintOther
                                     
    CMP AL, 122
    JBE PrintWord
    
    RET
Check ENDP

PrintWord:
    LEA DX, alert2
    MOV AH, 9
    INT 21h
      
    SUB i, 32
    MOV DL, i
    MOV AH, 2
    INT 21h  
    
    JMP Exit

PrintOther:
    LEA DX, alert3
    MOV AH, 9
    INT 21h
    
    LEA DX, newline
    MOV AH, 9
    INT 21h 
     
    JMP Input
       
Exit:
    MOV AH,4ch
    INT 21h
