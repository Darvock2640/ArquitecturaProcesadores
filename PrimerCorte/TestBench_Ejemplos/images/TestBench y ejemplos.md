# Archivo test bench

Ruta donde debería estár instalado el ModelSim : C:\intelFPGA_lite\20.1\modelsim_ase\win32aloem\

Para realizar la simulación de cualquier entidad diseñada se debe contruir un archivo test bench, este archivo también es de verilog.

El archivo test bench tiene una instanciación de la entidad de mayor jerarquía del proyecto y además contiene la base de tiempo de la simulación y los valores que van a tomar la entradas. su sintaxis es:

```verilog
`timescale 1ns/10ps     //unidad de tiempo de 1ns, precisión de 10ps

module nombreEntidad_TB;

    reg A, B;           //los register se utilizan para las entradas de la entidad que se va a testear
    wire X;             //Los wire se utilizan para las salidas de la entidad que se va a testear

    nombreEntidad DUT (.A(A), .B(B), .X(X)));           //Intancia de la entidad de mayor jerarquía

    initial 
        begin 
        //Aquí se especifica los valores de las entradas del sistema que se va a testear
        //Los "#20" especifican que deben transcurrir 20 unidades de tiempo

                    A=0; B=0;
			#20;	A=0; B=1;
			#20;	A=1; B=0;
			#20;	A=1; B=1;
			#40;
			$stop;
			$finish;
        end
endmodule
```

La idea es que el archivo test bench tenga el mismo nombre del modulo que creo es decir "nombreEntidad_TB.v"

Ejemplo con ADN de 2 entradas:

```verilog
//Esta es la entidad de mayor jerarquía y se llama "my_and2.v"

module my_and2 
(
	//Puertos
	input		wire A, B,
	output	wire X
);

assign X = A & B;

endmodule 
``` 

```verilog
// Este es el archivo test bench y se llama my_and2_TB.v

`timescale 1ns/10ps

module my_and2_TB;

	reg A,B;
	wire X;
	
	my_and2 DUT (.A(A), .B(B), .X(X));
	
	initial 
        begin 
					A=0; B=0;
			#20;	A=0; B=1;
			#20;	A=1; B=0;
			#20;	A=1; B=1;
			#40;
			$stop;
			$finish;
        end
endmodule
```

Ejemplo con sistemaX visto en 
[link sistema X](https://github.com/Darvock2640/ArquitecturaProcesadores/blob/master/PrimerCorte/OperadoresVerilog/Operadores%20en%20Verilog.md)

```verilog
// Entidad de mayor jerarquía llamada sistemaX

module sistemaX(input wire A, B, C,
                output wire F);

// Señales
wire An, Bn, Cn;
wire m0, m1, m2;

// complementos
assign An = ~A;
assign Bn = ~B;
assign Cn = ~C;

//Multiplicaciones
assign m0 = An & Bn & Cn;
assign m1 = An & B & Cn;
assign m2 = A & B & Cn;

//Suma
assign F = m0 | m1 | m2;

endmodule
```

```verilog
//Archivo Test Benh para la entidad sistemaX

`timescale 1ns/10ps

module sistemaX_TB;

reg A,B,C;
wire F;

sistemaX DUT (.A(A),.B(B),.C(C),.F(F));

	initial
		begin
		
					A=0;	B=0;	C=0;
		#20;		A=0;	B=0;	C=1;
		#20;		A=0;	B=1;	C=0;
		#20;		A=0;	B=1;	C=1;
		#20;		A=1;	B=0;	C=0;
		#20;		A=1;	B=0;	C=1;
		#20;		A=1;	B=1;	C=0;
		#20;		A=1;	B=1;	C=1;
		#40;
		$stop;
		$finish;
		
		end

endmodule
```