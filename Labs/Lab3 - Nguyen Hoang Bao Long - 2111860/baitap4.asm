.model small
.stack 200
.data
    msg db "?$"
    msg1 db "Nhap mot ky tu:$"
    newline db 13,10, "$"
    
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov msg, al
    mov bl, msg
    add bl, 4
    
    loop:
    lea dx, newline
    mov ah, 9 
    int 21h   
    inc msg
    mov dl, msg
    mov ah, 2
    int 21h
    
    cmp msg, bl
    jbe loop
    jmp exit
    
    exit:
    mov ah, 4ch
    int 21h