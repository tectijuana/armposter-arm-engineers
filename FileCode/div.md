# División de 9 entre 3 (9/3) en Ensamblador ARM32
## Interfuncionamiento entre instrucciones ARM Y THUMB

En el siguiente código se muestra como trabajar con instrucciones arm y thumb de manera intercalada para realizar una sencilla operación, la división de 9 entre 3. Todo esto gracias al uso del comando BX que nos permite saltar entre registros y cambiar el modo en que el procesador está trabajando, indicandole que queremos trabajar con instrucciones arm o thumb.

Para realizar la división, se hace uso de 3 registros, uno para almacenar el numerador, otro para almacenar el denominador y el tercero para almacenar el contador. La operación se lleva a cabo mediante un ciclo, en el cual en cada iteración se incrementa en 1 el contador y al numerador se le resta el denominador, el ciclo termina hasta que el valor del numerador ya no sea igual o mayor al denominador. Al final al contador se le resta 1, debido a que en la última iteración no se cumple la condición. El resultado de la división es el valor del contador, ya que nos indica cuantas veces cabe el denominador (3) en el numerador (9), en este ejemplo el resultado es 3, almacenado en el R3, que en la etiqueta exit es pasado al R0, para poder mostrarlo como salida al ejecutar el comando echo $? en la terminal.

```asm
.global main
.func main
.arm

main:    	ADR R5, thumbcode+1     //se asigna la dirección de la etiqueta thumbcode al registro 5
		MOV LR, PC              //se almacena la siguiente instrucción en el registro LR
		BX R5                   //salto al registro r5

exit:   	MOV R0, R3
		MOV R7, #1
		SWI 0

.thumb
thumbcode:      MOV R0, #9     //Se almacena el valor del numerador
		MOV R1, #3     //Se almacena el valor del denominador
		MOV R3, #0     //Se utiliza como contador para saber cuantas veces cabe
		
loop:    	ADD R3, #1    //Se aumenta el contador en 1
		SUB R0, R1    //Se resta valor del denominador al valor del numerador
		BGE loop      //Se preguna se el resultado es un valor mayor o igual
		SUB R3, #1    //Resultado de la división
		BX LR	      //Retorno a al código principal
```
