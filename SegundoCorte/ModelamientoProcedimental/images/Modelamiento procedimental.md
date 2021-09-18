# Modelamiento Procedimental 
La electrónica digital se divide en dos grandes grupos:
* Lógica combinacional:

    Se realizan soluciones digitales a partir de arreglos de compuertas lógicas donde las salidas del circuito dependen únicamente de sus entradas.

    En verilog los circuitos lógicos combinacionales se describen a partir de modelamiento concurrente. 

* Lógica secuencial:
    
    Se realizan soluciones digitales a partir de elementos que pueden almacenar información, además, en la mayoría de casos se utilizan señales de reloj. 

    Estos circuitos de forma fundamental están hechos a partir de compuertas lógicas pero se diferencian de la lógica combinacional por que sus salidas están retroalimentadas a las entradas. 

    En verilog los circuitos lógicos secuenciales se describen a partir de modelamiento procedimental. 

En este orden de ideas, el modelamiento procedimental hace referencia a descripciones que pueden activarse ***(Triggered)*** a través del cambio de estado, flanco de ascenso o descenso de un puerto o de una señal en especifico. Esto nos permite realizar descripciones de elementos secuenciales como flip-flop's, Latch., registros, etc ...

En el modelamiento procedimental las asignaciones solo pueden realizarce en tipos de datos de variables (reg, integer, real, time, realtime).

## Bloques procedimentales 

En el modelamiento procedimental todas las asignaciones deben estar encapsuladas dentro de bloques procedimentales. 

### Initial block 
En el ***initial block*** se ejecutaran todas las lineas al inicio de la simulación. Este bloque no permite realizar descripciones sintetizables. Su sintaxis es:

```verilog
initial
    begin   
        //Aquí van las asignaciones
end
```
### Always block
El bloque ***Always*** se ejecutara simpre. Si se utiliza en simulación se ejecutara mientras la simulación esté activa. Su sintaxis es:

```verilog
always
    begin
        //aquí van las asignaciones
end
```

Ejemplo

```verilog
always
    begin
        #10;
        clock = ~clock;
end
```

El ejemplo anterior no funciona por si mismo ya que la señal no contiene una condicion inicial. Para que este ejemplo sea funcional se necesita un bloque ***initial*** que asigne el valor inicial de la señal. 

```verilog

`timescale 1ns/10ps

module test_TB;

	reg	clock;
	
	initial
		begin
			clock = 1;
	end
	
	always
		begin
			#10;
			clock = ~clock;
	end

endmodule 
```

### Listas sensitivas
Las listas sensitivas son usadas en conjunto con los bloques procedimentales para ejecutar ***(triggered)*** sus asignaciones, es decir, únicamente se ejecutaran las asignaciones del bloque cuando alguna de las señales enumeradas en la lista sensitiva cambie. Su sintaxis es:

```verilog 
always @(señal1, señal2, ... señalN)
    begin
        //Aquí van las asignaciones
end
```
Ejemplo 

```verilog
// modulo
module test(
	input		wire	A, B, C,
	output	reg	F
);
	always @(A, B, C)
		begin
			F = A & B & C;
	end

endmodule 
```
```verilog
// testbench

`timescale 1ns/10ps

module test_TB;

	reg 	in1, in2, in3;
	wire	out;
	
	test DUT(.A(in1), .B(in2), .C(in3), .F(out));
	
	initial
		begin
					in1=0; in2=0; in3=0;
			#20	in1=0; in2=0; in3=1;
			#20	in1=0; in2=1; in3=0;
			#20	in1=0; in2=1; in3=1;
			#20	in1=1; in2=0; in3=0;
			#20	in1=1; in2=0; in3=1;
			#20	in1=1; in2=1; in3=0;
			#20	in1=1; in2=1; in3=1;
			#20;
	end

endmodule 
```
Las listas sensitivas tienen palabras reservadas que especifícan la naturaleza de la señal o cual es el cambio que debe tener la señal para activar el bloque. Estas son ***negedge*** ***posedge***.

Ejemplo

Flip - flop tipo D sin las entradas asincronas (set - reset)
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
