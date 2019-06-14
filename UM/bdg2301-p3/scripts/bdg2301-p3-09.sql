/*
                    EJERCICIO 9
9. Crear y manipular una vista.
a- Definir una vista llamada  CONTRATO  que, para cada revista muestre los contratos de sus periodistas
de plantilla, incluyendo:
? el nombre de la revista,
? el nombre del periodista de plantilla,
? el sueldo,
? la fecha de contrato,
? los años que lleva trabajando en la revista (calculados a partir de la diferencia entre la fecha de
contrato y la fecha actual; ojo, asegúrese de que calcula bien el número de días),
? el total de dinero que ha cobrado desde que fue contratado hasta hoy (calculado como los
meses de contrato por el sueldo).
Columnas de la vista:  (revista, periodista, sueldo, contrato, años, cobrado)
b- Mostrar el contenido completo (con  SELECT * ) de la vista, ordenado por  revista y  periodista .
c- Eliminar de la vista la columna  contrato .
d- Mostrar de nuevo el contenido de la vista para confirmar si se ha realizado el cambio o no.
e- Modifique los valores de la columna  cobrado para que el valor aparezca incrementado en un 3%.
f- Volver a mostrar el contenido completo de la vista, para comprobar la corrección de los datos.
g- ¿Qué datos se han modificado realmente?
h- Inserte un nuevo periodista de plantilla de cualquier revista, no coordinador, sin tutor, con fecha
de contrato de hace al menos 5 años. ¿Se aplica el cambio al visualizar el contenido de la vista? Es
decir ¿aparece el incremento del 3% para la nueva fila?
*/

--a) 
CREATE OR REPLACE VIEW CONTRATO AS 
SELECT revista,nombre AS periodista,sueldo,fecha_contrato AS contrato,
       	TRUNC(((SYSDATE-fecha_contrato)/365),2) AS años, 
       	TRUNC(((SYSDATE-fecha_contrato)/365*12*sueldo),3) AS cobrado
FROM PERIODISTA_PLANTILLA;

--b) 
SELECT *
FROM CONTRATO
ORDER BY revista, periodista;

--c) 
CREATE OR REPLACE VIEW CONTRATO AS 
SELECT revista,nombre AS periodista,sueldo,
       	TRUNC(((SYSDATE-fecha_contrato)/365),2) AS años, 
       	TRUNC(((SYSDATE-fecha_contrato)/365*12*sueldo),3) AS cobrado
FROM PERIODISTA_PLANTILLA;

--d) demostración
SELECT *
FROM CONTRATO
ORDER BY revista, periodista;

--e)

CREATE OR REPLACE VIEW CONTRATO
AS SELECT revista,nombre AS periodista,sueldo,
      	 TRUNC(((SYSDATE-fecha_contrato)/365),2) AS años, 
          TRUNC(((SYSDATE-fecha_contrato)/365*12*sueldo),3)*1.03 AS cobrado
FROM PERIODISTA_PLANTILLA;

--f)

SELECT *
FROM CONTRATO
ORDER BY revista, periodista;

--g) Solamente se modifica los datos del cobro de la vista, puesto que no puede modificar
-- directamente los datos que se encuentran en el disco base


--h) 
INSERT INTO periodista_plantilla (DNI,email,nombre,sueldo,revista,fecha_contrato,tutor)
  VALUES('00122334X','fhuuwf@um.es','Yulen','2288','R1',TO_DATE('12-OCT-2012','dd-MON-yyyy'),NULL);
  
SELECT *
FROM CONTRATO
ORDER BY revista, periodista;

-- Se aplica el incremento al periodista nuevo insertado, dado que lo hemos especificado en la vista

