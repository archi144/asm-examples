;Print Hellostr 4 times to stdout
MODEL TINY
STACK 100h   
DATASEG
    Hellostr DB 'Hello First Step Site'
CODESEG     
start:  
    mov ax,@data 
    mov ds,ax   
    mov cx,4 ; move 4 to cx
cycle_start:
    dec cx  ; decrease cx
    push cx  ; push cx to stack
    mov bx,1
    mov cx,21
    mov dx,offset Hellostr 
    mov ah,40h ; print Hellostr to stdout 
    int 21h ; call 21h interruption
    pop cx  ; pop cx from stack
    jcxz cycle_end  ; jump to cycle_end if cx contains 0
    jmp cycle_start  ; jump to cycle start
cycle_end:
    mov ah, 04Ch  ; call end of programm function
    mov al, 0h  ; return code of programm
    int 21h
end start
