# Ejemplo de condicional en ensamblador ARM32

Aquí tenemos un ejemplo sencillo de un programa en ensamblador que compara dos números, dependiendo de qué número sea mayor se seguirá un flujo en el programa u otro.

En el caso de que el primer número se mayor la condición “blt  r1_lower ” no se cumple y el programa sigue su flujo normal hasta el final, pero en caso contrario en el que el segundo número sea el mayor la condición se cumple  y hace el salto a la etiqueta “r1_lower” cambiando el flujo del programa.

Al final, ambas condiciones almacenan el valor mayor en el registro 0.

```asm
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
```
> *"Código de comparación de dos números en ensamblador ARM32"*


<br></br>

# Equivalente en lenguaje C 

El siguiente código de la parte inferior es una muestra del código equivalente en el lenguaje C al código en ensamblador de la parte superior.
Se declaran 3 variables con valores iniciales, se hace comparación y el número mayor es almacenado en la variable “max”.

```C
int main() {
   int max = 0;
   int a = 2;
   int b = 3;
   if(a < b) {
    max = b;
   }
   else {
    max = a;
   }
   return max;
}
```
> *"Código de comparación de dos números en el lenguaje C"*
