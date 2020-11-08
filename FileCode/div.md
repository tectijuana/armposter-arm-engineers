# División de 9 entre 3 (9/3)
## Interfuncionamiento entre instrucciones ARM Y THUMB

En el siguiente código se muestra como trabajar con instrucciones arm y thumb de manera intercalada para realizar una sencilla operación, la división de 9 entre 3. Todo esto gracias al uso del comando BX que nos permite saltar entre registros y cambiar el modo en que el procesador está trabajando, indicandole que queremos trabajar con otro tipo de instrucciones.

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
