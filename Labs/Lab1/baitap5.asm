.MODEL SMALL
.STACK
.DATA
    DULIEU DB 00h
    msg db "Nhap mot ky tu:$"
    msg1 db 13,10,"Ky tu dung truoc:$"
    msg2 db 13,10,"Ky tu dung sau:$"
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 9 
    int 21h
    
    mov ah, 1
    int 21h
    mov DULIEU, al
    
    lea dx, msg1
    mov ah,9 
    int 21h
    
    mov ah, 2
    mov dl, DULIEU
    DEC dl
    int 21h
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, DULIEU
    inc dl
    int 21h
    ret
    
    mov ah, 4ch
    int 21h