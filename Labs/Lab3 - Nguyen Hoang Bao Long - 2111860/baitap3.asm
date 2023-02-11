.model small
.code
    mov al,'A'
    mov dl,al
    mov  ah,2
    
    loop:
    int 21h
    inc dl
    cmp dl,5Ah
    jng loop
    
    mov ah,4ch
    int 21h