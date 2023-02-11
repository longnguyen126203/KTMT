.model small


.data
 chuoi1 db 'Nhap vao so o he bin (0 or 1 or nhap ESC de thoat : $'
 chuoi2 db 'Nhap sai dinh dang xin nhap lai tu dau$'                      
 chuoi3 db 'Ky tu vua nhap la                                 : $' 
 ketthuc db 'Ket thuc chuong trinh $'
 clrf db 13,10,'$'
.code
mov ax,@data
mov ds,ax                      

;xuat chuoi 
start:
lea dx,clrf 
mov ah,9
int 21h
lea dx,chuoi1
mov ah,9
int 21h
xor ax,ax
xor bx,bx
xor cx,cx 

;nhap gia tri
nhap:
mov ah,1
int 21h
cmp al,1Bh
je end
cmp al,030h
je them
cmp al,031h
je them
cmp al,0Dh;nhap enter de xuat
je xuat


;==========
;xuong dong
lea dx,clrf
mov ah,9
int 21h
;nhap lai chuoi khi nhap sai
lea dx,chuoi2
mov ah,9
int 21h 
;xuong dong
lea dx,clrf
mov ah,9
int 21h
jmp start

;gan gia tri cho bl
them: 
and al,0Fh
shl bx,1
add bl,al
inc cx
cmp cl,10h;neu du 16 bit thi xuat 
je xuat
jmp nhap

;xuat chuoi bin vua nhap
xuat:
lea dx,clrf 
mov ah,9
int 21h
lea dx,chuoi3
mov ah,9
int 21h

;in ra cac so 0 1
mov cl,11h            
mov ah,2
;vong lap 16 lan            
lap:
dec cl
cmp cl,0;du 16 bit thi ket thuc
je start

Shl Bx, 1       
Jc  In1      
Mov Dl, '0'
Int 21h
jmp lap
in1:
mov dl,'1'
int 21h
jmp lap

;ket thuc chuong trinh
end:
lea dx,clrf
mov ah,9
int 21h
lea dx,ketthuc
mov ah,9
int 21h
mov ah,4ch
int 21h                               