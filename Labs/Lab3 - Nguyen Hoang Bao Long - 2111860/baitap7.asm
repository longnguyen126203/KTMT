.MODEL small
.STACK
.DATA  
    alert1 DB "Nhap mot ky tu(hoac ESC): $"
    alert2 DB 10,13,"Ky tu da nhap la chu$"  
    alert3 DB 10,13,"Ky tu da nhap la so$"
    alert4 DB 10,13,"Ky tu da nhap khac chu/so$"   
    newline DB 10,13,"$"
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
BeginLoop:   
    LEA DX, alert1
    MOV AH, 9
    INT 21h 

    MOV AH, 1
    INT 21h
    
    ;ESC
    CMP AL, 27
    JBE ESC
          
    ;0-9
    CMP AL, 57
    JBE ConvertToNumber                   
    
    ;A-Z
    CMP AL, 90
    JBE ConvertToWord1
    ;a-z
    CMP AL, 122
    JBE ConvertToWord2

    JMP ELSE  
    
    

ConvertToNumber:
    CMP AL, 48
    JAE PrintNumber
    JMP ELSE

ConvertToWord1:
    CMP AL, 65
    JAE PrintWord 
    JMP ELSE
          
ConvertToWord2:
    CMP AL, 97
    JAE PrintWord
    JMP ELSE

ELSE:
    JMP PrintOther

ESC:
    CMP AL, 27
    JMP Exit

PrintWord:
    LEA DX, alert2
    MOV AH, 9
    INT 21h 
     
    LEA DX, newline
    MOV AH, 9
    INT 21h 
    
    JMP BeginLoop

PrintNumber:
    LEA DX, alert3
    MOV AH, 9
    INT 21h 
     
    LEA DX, newline
    MOV AH, 9
    INT 21h 
    
    JMP BeginLoop

PrintOther:
    LEA DX, alert4
    MOV AH, 9
    INT 21h
     
    LEA DX, newline
    MOV AH, 9
    INT 21h 
    
    JMP BeginLoop

Exit:
    MOV AH, 4ch
    INT 21h