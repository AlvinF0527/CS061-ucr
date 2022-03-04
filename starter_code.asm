.orig x3000

LD R6, TOP_STACK
LD R5, MAX_STACK
LD R4, BASE_STACK

;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
LD R0, DEC_4
LD R1, PUSH_VAL_SUB
JSRR R1


;push_val(3) pushes the value 3 onto the stack [4,3]
LD R0, DEC_3
JSRR R1

;push_val(2) pushes the value 2 onto the stack [4,3,2]
LD R0, DEC_2
JSRR R1


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R0, DEC_0

LD R1, ADD_VAL_SUB
JSRR R1


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R1, ADD_VAL_SUB
JSRR R1



;move the top value of the stack into r4
LDR R4, R6, #0


HALT

PUSH_VAL_SUB .FILL x3400
ADD_VAL_SUB .FILL x3800


BASE_STACK .FILL xA000
TOP_STACK .FILL xA000
MAX_STACK .FILL xA005

DEC_4 .FILL #4
DEC_3 .FILL #3
DEC_2 .FILL #2
DEC_0 .FILL #0

.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

    ST R7, backup_r7_3400
;----------------------------------------------------

    ADD R6, R6, #1 
    STR R0, R6, #0
     
    
;----------------------------------------------------    
    LD R7, backup_r7_3400
    
    
    ret
    
    backup_r7_3400 .BLKW  #1  
.end




.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    ST R0, backup_r0_3800
    ST R3, backup_r3_3800
    ST R4, backup_r4_3800
    ST R7, backup_r7_3800
;----------------------------------------------------

    LDR R3, R6, #0       
    STR R0, R6, #0
    ADD R6, R6, #-1
    
    
    
    
    
    LDR R4, R6, #0            
   ; ADD R6, R6, #-1

    ADD R3, R3, R4
    STR R3, R6, #0
    
    



;----------------------------------------------------


    LD R0, backup_r0_3800
    LD R3, backup_r3_3800
    LD R4, backup_r4_3800
    LD R7, backup_r7_3800
    
    
    
    ret
    
    backup_r0_3800 .BLKW  #1  
    backup_r3_3800 .BLKW  #1  
    backup_r4_3800 .BLKW  #1  
    backup_r7_3800 .BLKW  #1  

.end



.orig x4200 ;;data you might need

.end