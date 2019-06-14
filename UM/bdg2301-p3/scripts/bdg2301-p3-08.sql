/* EJERCICIO 8
a- Eliminar, una a una, las columnas que contienen la web y la periodicidad de las revistas.
b- ¿Es posible hacer esta operación mediante una sola sentencia? Si es así, hágalo.
*/
--a
ALTER TABLE REVISTA 
  DROP COLUMN web;
ALTER TABLE REVISTA 
  DROP COLUMN periodicidad;
--b 
ALTER TABLE REVISTA 
  DROP ( web, periodicidad );