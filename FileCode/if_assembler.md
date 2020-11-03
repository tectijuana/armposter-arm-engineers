
# Ejemplo ...


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

# Para lenguaje C 
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
