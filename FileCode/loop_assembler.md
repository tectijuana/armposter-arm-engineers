# Ejemplo de bucle en ensamblador ARM32

Aquí tenemos un ejemplo sencillo de un programa en ensamblador que compara el valor de un registro con 4, cuando entramos a la etiqueta “loop” se hace la comparación, en caso
de que se cumpla la condición el programa cambia el flujo de trabajo y hace el salto al final ignorando el código restante. En caso contrario, en el que el valor del registro
sea menor a 4 no se cumple la condición y el programa sigue la ejecución con su flujo normal hasta la última instrucción de la etiqueta. 

**Notese** que al final de “loop” se hace el salto nuevamente a “loop”, esto lo podemos considerar como un ciclo que se estará repitiendo hasta que se cumpla condición de que
el valor del registro sea igual a 4.

```asm
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
```
> *"Código de bucle en ensamblador ARM32"*

<br></br>

# Equivalente en lenguaje C
El siguiente código de la parte inferior es una muestra del código equivalente en el lenguaje C al código en ensamblador de la parte superior.
Se declara una variable “a” con un valor inicial de 0, posteriormente se utiliza un ciclo “while” que comprueba que el valor sea menor/igual a 4, en caso de que no se cumpla la
condición entra al bucle y aumenta la variable en 1. Se seguirá cumpliendo hasta cuando se rompa la condición.


```c
int main() {
   int a = 0;
   while(a <= 4) {
   a= a+1;
   }
   return a;
}
```
> *"Código de bucle en el lenguaje C"*
