.model small
.stack 100h
.data
    msg db 'nhap so nhi phan $'
    msg1 db 0dh,0ah,"so nhi phan vua nhap $"    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        ;nhac nhap
        mov ah,09
        lea dx,msg
        int 21h
        
        mov bx,0
        mov cx,16
        
    again:    
        mov ah,01h
        int 21h
        cmp al,13
        je printout
        and al,0Fh
        shl bx,1
        or bl,al
        loop again
        
     printout:
        mov ah,09h
        lea dx,msg1
        int 21h
          mov cx,16
      disp:  
        shl bx,1
        jnc again1
        
            mov dl,49
            mov ah,02h
            int 21h   
            jmp display
            
    again1:
        mov dl,48
        mov ah,02h
        int 21h   
     display:
     loop disp   
       mov ah,4ch
       int 21h
       main endp
    end main