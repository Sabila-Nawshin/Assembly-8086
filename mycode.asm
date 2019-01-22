ORG 100H 
.model small
.stack 100h

.DATA
VAR DW 100
VA2 DW 70
.CODE

MAIN PROC
    MOV DX, @DATA
    MOV DS, DX 
    
    MOV AH, 0h      ;video mode settings, 320 x 200 pixels     
    MOV AL, 13H         
    INT 10H        
    
    ;Drawing a box as background for the cicle
        
    MOV CX, 120       ; cx = x co-ords, dx = y co-ords, al = color, ah changes pixel color
    MOV DX, 50      
    MOV AH, 0CH
    add va2, dx         
    
    
    ;drawing the background colors
    
    ;green
    mov var, 390
    mov al, 02d
    mov dx, 0h
    draw3:
        mov cx, 0
        
        DRAW4:
            INT 10H 
        
            INC CX
        
            cmp cx, var
            jle draw4
        inc dx
        cmp dx,50
        jle draw3
        
    ;yellow
    mov al, 14d
    draw5:
        mov cx, 0
        
        DRAW6:
            INT 10H 
        
            INC CX
        
            cmp cx, var
            jle draw6
        inc dx
        cmp dx,va2
        jle draw5
            
    ;red
    mov al, 04
    mov dx, 120
    draw9:
        mov cx, 0
        
        DRAW10:
            INT 10H 
        
            INC CX
        
            cmp cx, var
            jle draw10
        inc dx
        cmp dx,200
        jle draw9
    
    
    
    ;drawing the middle circle
    
    ;no good algo for circle found. Going on with a rectangle for now   
    MOV CX, 120
    MOV DX, 40 
    MOV AL, 9d     
    MOV AH, 0CH
    mov var, 100
    mov va2, 90
    add var, cx
    add va2, dx        
    
    draw2:
        MOV CX, 100
        
        DRAW1:
            INT 10H 
        
            INC CX
        
            cmp cx, var
            jne draw1
            
        inc dx
        cmp dx,va2
        jne draw2
    
    
    ;the star
    mov al,0eh
    mov cx, 170
    mov dx, 50
    mov va2,120
    mov var,110  
    
    draw7:
        int 10h
        
        dec cx
        inc dx
        
        cmp cx, var
        jge draw7
        
        
    ;add cx, 5
    ;sub dx, 3
    mov va2, 60
        
    draw8:
        int 10h
        
        inc cx
        inc cx
        dec dx     
            
        cmp dx,va2
        jne draw8
        
        
    ;add dx, 5
    ;sub cx, 3
    ;mov var, 167 
    
    
    ;sub cx, 5
    mov var, 110
    draw11:
        int 10h
        
        dec cx
        
        cmp cx, var
        jge draw11
        
    ;add cx, 5
    ;add dx, 3
    mov var, 210
    
    draw12:
        int 10h
        
        inc cx
        inc cx
        inc dx     
            
        cmp cx,var
        jle draw12
        
    
    ;sub cx, 5
    ;sub dx, 3
    mov va2,50     
    draw13:
        int 10h
        
        dec cx
        dec dx
        
        cmp dx, va2
        jne draw13 
    
               
    mov ax, 0
    int 21h
   
    mov ah, 1
    int 21h
   
    mov ah, 4ch
    int 21h
   
            
   ret     
endp main 


                   

end main
        