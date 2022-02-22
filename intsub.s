    // intsub function in this file

    .arch armv8-a
    .global intsub

intsub:

    stp x29, x30, [sp,-16]!
    add x29, sp, 0
    stp x19, x20, [sp,-16]!
    stp x21, x22, [sp,-16]!

    mov x19, x2
    mov x20, x3

    // Twos complement of x3
    mov x21, #0xFFFFFFFFFFFFFFFF
    eor x20, x21, x20   // invert x3
    mov x2, x20  // add 1 to x3
    mov x3, 1
    bl  intadd

    // Add x2, x3
    mov x3, x0
    mov x2, x19
    bl intadd
    

    ldp x21,x22, [sp], 16
    ldp x19,x20, [sp], 16
    ldp x29,x30, [sp], 16
    
    ret
