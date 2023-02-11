.MODEL SMALL
.STACK
.DATA
    string DB 'Hello, World!', 0Ah, 0Dh, 'Hello, solar system!', 0Ah, 0Dh, 'Hello, universe!$'
.CODE

MOV AX, @DATA
MOV DS, AX

LEA DX, string
MOV AH, 09H
INT 21H

MOV AH, 4CH
INT 21H

