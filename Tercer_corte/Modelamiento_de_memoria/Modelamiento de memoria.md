# Modelamiento de memoria 
El modelamiento de memoria en verilog se realiza en forma matricial y puede ser sintetizada en una amplia gama de dispositivos ***"Semiconductor Memory"***. 

## Arquitectura y terminología 
El termino **memoria** es usado para describir un sistema con la habilidad de almacenar información digital. 

El termino ***Semiconductor memory*** hace referencia a sistemas que están implementados usando tecnología de circuitos integrados.

Estos tipos de sistemas de almacenamiento de información digital usan transistores, fusibles, condensadores and/or en un simple sustrato semiconductor. 

La memoria basada en semiconductores es llamada ***Memoria de estado solido*** ya que no tiene partes moviles, además, puede almacenar más información por unidad de área que otras tecnologías. 

### Mapa de un modelo de memoria 
La información almacenada en memoria es llamada ***"data - dato"***. Cuando la información es ubicada en memoria se conoce como ***""write - escribir***, por el contrario, cuando la información es extraida de la memoria, esta acción se denomina ***"read - leer"***. 

Para poder acceder a los datos almacenados en una memoria se utiliza una ***"addres - dirección"***, esta dirección apunta a un grupo de **N** bits denominado ***"word - palabra"***. Si una memoria tienen **N = 8**, esto significa que 8 bits de datos son almacenados en cada dirección. 

El número de direcciones de memoria se describe usando la variable ***"M"***, por lo tanto, el tamaño total de la memoria se define como **M x N**. 

Debido a que la dirección se implementa como un código binario, la cantidad de lineas en el bus de dirección **(n)** indicará el número de posiciones de memoria que el sistema tiene **$M = 2^n$** 
