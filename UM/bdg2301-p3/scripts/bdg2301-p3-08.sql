/* EJERCICIO 8
a- Eliminar, una a una, las columnas que contienen la web y la periodicidad de las revistas.
b- �Es posible hacer esta operaci�n mediante una sola sentencia? Si es as�, h�galo.
*/
--a
ALTER TABLE REVISTA 
  DROP COLUMN web;
ALTER TABLE REVISTA 
  DROP COLUMN periodicidad;
--b 
ALTER TABLE REVISTA 
  DROP ( web, periodicidad );