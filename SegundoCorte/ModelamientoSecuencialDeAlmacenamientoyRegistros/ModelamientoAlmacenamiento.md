# Modelamiento secuencial de almacenamiento y registros
## Modelamiento de dispositivos de almacenamiento escalar 
### Latch tipo D
Debido a que la asignación o actualización del valor de un dispositivo de almacenamiento no es continua, este modelamiento se realizará a traves de bloques procedimentales. 

![Latch D](images/D-LATCH.png)

```verilog
// modulo
module LatchD(
	input		wire 	D, E,
	output	reg	Q, Qn
);

	always@(D, E)
		if (E==1'b1)
			begin
				Q  <=  D;
				Qn <= ~D;
			end
endmodule 
```