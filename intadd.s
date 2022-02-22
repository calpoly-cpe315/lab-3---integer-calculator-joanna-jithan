    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    stp x29, x30, [sp,-16]!
    add x29, sp, 0
    stp x19, x20, [sp,-16]!

    mov x19, x2
    mov x20, x3
    
while:
    mov x4, x2 //FIRST INTEGER
    mov x5, x3 //SECOND INTEGER
    
    and x4, x4, x3//FIRST INTEGER, SECOND INTEGER
    eor x5, x5, x2//FIRST INTEGER, SECOND INTEGER
    
    mov x2, x4
    lsl x2,x2, #1
    mov x3, x5
    
    cmp x2, #0
    bne while

    ldp x19, x20, [sp], 16
    ldp x29,x30, [sp], 16
    
    ret
