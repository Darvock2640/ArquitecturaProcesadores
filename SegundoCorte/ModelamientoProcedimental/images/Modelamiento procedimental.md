# Modelamiento secuencial 
La electrónica digital se divide en dos grandes grupos:

* Logica combinacional 
	Se realizan soluciones digitales a partir de arreglos de compuertas lógicas donde sus salidas
	dependen unicamente de sus entradas. 
	
	En Verilog, los circuitos de lógica combinacional se describen a partir de modelamiento concurrente.

* Logica secuencial
	Se realizan soluciones digitales a partir de elementos que pueden almacenar información, además, 
	en la mayoria de casos se utilizan señales de reloj.
	
	Estos circuitos de forma fundamental están hechos con compuertas lógicas pero se diferencian
	de la lógica combinacional por que sus salidas depende de sus entradas y también de sus 
	salidas, es decir, estan retroalimentados. 
	
	En Verilog, los circuitos de lógica secuencial se describen a partir de modelamiento procedimental.

En este orden de ideas, el modelamiento secuencial hace referencia a descripciones que pueden activarse ***(Triggered)*** a traves del cambio de estado, o flanco de ascenso o descenso de un puerto o señal en espcífico. Esto nos permite realizar descripciones de elementos secuenciales como flip-flop's, Latch, registros, etc...

En el modelamiento procedimental las asignaciones solo pueden realizarce en tipos de datos de variables (reg, integer, real, time, realtime). 

## Bloques procedimentales 
En el modelamiento procedimental todas las asignaciones deben estar encapsuladas dentro de bloques procedimentales. 

### initial block 
En este bloque se ejecutaran todas las lineas de código al inicio de la simulación. Este bloque no permite realizar descripciones sintetizables. Su sintaxis es:

```verilog
initial
    begin
        //Aquí van las asignaciones
end
```
### Always block
El bloque ***Always*** se ejecutará  siempre, o en caso de simulación, mientras esta esté activa. Su sintaxis es:

```verilog
always
    begin
    //Aquí va la asignación
end
```
Ejemplo 

```verilog
always
    begin
    #10 clock = ~clock;
end
```
El ejemplo anterior no funciona por si mismo ya que no se conoce el estado inicial de clock. Para que sea funcional se requiere de un bloque inicial así:

```verilog
initial
    begin
        clock = 0;
end
always
    begin
    #10 clock = ~clock;
end
```
### Listas sensitivas 
Una lista sensitiva es usada en conjunto con un bloque procedimental para ejecutar ***(triggered)*** sus asignaciones, es decir, únicamente se ejecutaran las asignaciones del bloque cuando algunas de las señales enumeradas en la lista sensitiva cambie. su sintaxis es:

```verilog
always @ (señal1, señal2, ... señalN)
    begin
        // aquí van las asignaciones
end
```
Los compiladores modernos de verilog son capaces de sintetizar circuitos combinacionales así esten hechos dentro de un bloque procedimental. En algunos casos es más facil describir circuitos lógicos combinacinales utilizando asignaciones procedimentales. 

Ejemplo
```verilog
module test(
	input	wire	A,B,C,
	output	reg	F
);

always @(A, B, C)
	begin
		F = A & B & C;
end

endmodule 
```
Las listas sensitivas tienen palabras reservadas que especifican la naturaleza de la señal o cual es el cambio que debe tener la señal para activar el bloque. Entre ellas tenemos ***negedge*** y ***posedge***. 

Ejemplo

flip - flop tipo data sin los puertos asincronos (reset- clear)

```verilog
module test(
	input	wire	D, clock,
	output	reg	Q
);

always @(posedge clock)
	begin
		Q = D;
end

endmodule 
```
