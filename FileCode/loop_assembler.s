.global main

main:
        mov     r0, #0     /* Configurando la  variable inicial a */
loop:
        cmp     r0, #4     /* Comprobando si a==4 */
        beq     end        /* Procediendo al final si a==4 */
        add     r0, r0, #1 /* Aumenta a en 1 si el salto al final no ocurrio (a!=4) */
        b loop             /* Se repite el loop */
end:
        bx lr              /* El fin */
