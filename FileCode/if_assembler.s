/*
Instituto Tecnologico de Tijuana
Depto de Sistemas y Computación
Ing. En Sistemas Computacionales
Autor: Rodolfo Zamora Lopez @nickname RodolfoZamora999
Repositorio: https://github.com/tectijuana/armposter-arm-engineers (Respositorio publico)
Fecha de revisión:  03/11/2020
Objetivo del programa:
Comparación de dos números, se determina cual es mayor
*/

.global main

main:
        mov     r1, #2     /* Configurando la variable inicial a */
        mov     r2, #3     /* Configurando la variable inicial b */
        cmp     r1, r2     /* Comparando variables para determinar cual es mas grande */
        blt     r1_lower   /*  saltar a r1_lowe en caso de que r2 sea mas grande (N==1) */
        mov     r0, r1     /* Si no se prodjo el salto, r1 es mas grande (o lo mismo), asi que almacena r1 en r0 */
        b       end        /* Continuar hasta el final */
r1_lower:
        mov r0, r2         /* Terminamos aqui porque r1 era menor que r2, asi que almacenamos r2 en r0 */
        b end              /* Proseguir al final */
end:
        bx lr              /* El fin */
