.model small
.stack 200
.data
    msg db "Nhap mot ky tu:$"
    msg1 db 13, 10, "Chao buoi sang$"
    msg2 db 13, 10, "Chao buoi chieu$"
    msg3 db 13, 10, "Chao buoi toi$"
.code
    mov ax, @data
    mov ds, ax
    
    start:
    ;Hien thi dong nhac nhap
    lea dx, msg
    mov ah, 9
    int 21h
    
    ;Nhap mot ky tu
    mov ah, 1 
    int 21h
    
    cmp al, 53h
    JE CHAOBUOISANG
    
    cmp al, 73h
    JE CHAOBUOISANG
    
    cmp al, 43h
    JE CHAOBUOICHIEU
    
    cmp al, 63h
    JE CHAOBUOICHIEU
    
    cmp al, 54h
    je CHAOBUOITOI
    
    cmp al, 74h
    je CHAOBUOITOI
    
    ;quay lai 1 (vi nhap khong dung)
    mov ax, 3
    int 10h
    jmp start
    
    CHAOBUOISANG:
    lea dx, msg1
    mov ah, 9
    int 21h
    jmp Exit
    
    CHAOBUOICHIEU:
    lea dx, msg2
    mov ah, 9
    int 21h
    jmp Exit
    
    CHAOBUOITOI:
    lea dx, msg3
    mov ah, 9
    int 21h
    jmp Exit
    
    Exit:
    mov ah, 4ch
    int 21h