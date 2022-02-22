    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    stp x29, x30, [sp,-16]!
    add x29, sp, 0
    str x19, [sp,-8]!
    str x20, [sp,-8]!

    mov x19, w2
    mov x20, w3
    
    b while

    ldr x19 ,[sp], 8
    ldr x20 ,[sp], 8
    ldp x29,x30, [sp], 16
    
    ret

while:
    mov x1, w2 //FIRST INTEGER
    mov x2, w3 //SECOND INTEGER
    
    and x3, w2, w3//FIRST INTEGER, SECOND INTEGER
    eorr x1, w2, w3//FIRST INTEGER, SECOND INTEGER

    lsl x2, x3, #1
    
    cmp x2, #0
    bne while
