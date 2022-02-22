    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

.global         print
print:
      stp    x29, x30, [sp, -16]! //Store FP, LR.
      add    x29, sp, 0
      mov    x3, x0
      mov    x2, x1
      ldr    w0, startstring
      mov    x1, x3
      bl     printf
      ldp    x29, x30, [sp], 16
      ret 

startstring:
        .word   result
    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions




    // You'll need to scan characters for the operation and to determine
    // if the program should repeat.
    // To scan a character, and compare it to another, do the following
loop:
      
      ldr     w0, =enter1     // Print operator 1
      bl      printf

      ldr     w0, =scanlong
      mov     x1, sp          // Save stack pointer to x1, you must create space 
      bl      scanf           // Scan user's answer
      ldr     x2, [sp]        // save `oeprator 1` in w2
 
      ldr     w0, =enter2     // Print operator 2
      bl      printf

      ldr     w0, =scanlong
      mov     x1, sp          // Save stack pointer to x1, you must create space 
      bl      scanf           // Scan user's answer
      ldr     x3, [sp]        // save `oeprator 2` in w3

      ldr     w0, =operator   // Print operator
      bl      printf

      ldr     w0, =scanchar
      mov     x1, sp          // Save stack pointer to x1, you must create space 
      bl      scanf           // Scan user's answer
      ldrb    w4, [sp]        // save `operator` in w4

ifadd:
      ldr     x1, =add
      ldrb    w1, [x1]
      cmp     w4, w1
      b.ne    ifsub    
      bl      intadd
      b       endif
ifsub:
      ldr     x1, =sub
      ldrb    w1, [x1]
      cmp     w4, w1
      b.ne    ifmul    
      bl      intsub
      b       endif
ifmul:
      ldr     x1, =mul
      ldrb    w1, [x1]
      cmp     w4, w1
      b.ne    endif
      bl      intmul
      b       endif
endif:
      
      mov     x1, x0          // Move return value to x1
      ldr     w0, startstring // Print result
      bl      printf


      ldr     w0, =again      // Print again?
      bl      printf

      ldr     w0, =scanchar
      mov     x1, sp          // Save stack pointer to x1, you must create space 
      bl      scanf           // Scan user's answer
      ldr     x1, =yes        // Put address of 'y' in x1
      ldrb    w1, [x1]        // Load the actual character 'y' into x1
      ldrb    w0, [sp]        // Put the user's value in r0
      cmp     w0, w1          // Compare user's answer to char 'y'
      b.eq       loop            // branch to appropriate location
end:
      ldr       w0, 0         // exit 0
      bl        exit
      

yes:
    .byte   'y'
add:
   .byte    '+'
sub:
   .byte    '-'
mul:
   .byte    '*'
again:
    .asciz  "Again? "
enter1:
    .asciz  "Enter number 1: "
enter2:
    .asciz  "Enter number 2: "
operator:
    .asciz  "Enter operator: "
result:
    .asciz  "Result is: %d\n"
scanchar:
    .asciz  " %c"
scanlong:
   .asciz   " %ld"
