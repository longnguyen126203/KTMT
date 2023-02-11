.model small
.stack 200
.data
    first db '?$'
    msg db "Nhap mot ky tu:$"
    msg1 db 13,10, "5 Ky tu dung truoc:$"
    msg2 db 13,10, "5 Ky tu dung sau:$"
    
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 9 
    int 21h
    
    ;nhap mot ky tu
    mov ah, 1
    int 21h
    
    ;lay 5 ky tu dung truoc
    mov first, al
    mov bl, first
    dec first
    sub bl, 6
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
    ; thuc hien vong lap
    startloop:
    inc bl
    mov dl, bl
    mov ah, 2
    int 21h
    cmp bl, first
    jb startloop
    
    lea dx, msg2
    mov ah, 2
    int 21h
    inc first
    mov bl, first
    add bl, 5
    
    startloop2: 
    inc first
    mov dl, first
    mov ah, 2
    int 21h
    cmp first, bl
    jb startloop2
    jmp exit
    
    exit:
    mov ah, 4ch
    int 21h