-------------------------------------------------------------------------------------------------------
--------------5. Intercambiar los periodistas de plantilla de dos revistas diferentes------------------
-------------------------------------------------------------------------------------------------------
--a)
--Usamos R1, R2

--b)
--Mostramos la revista R1
SELECT dni,nombre,revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R1';

--Mostramos la revista R2
SELECT dni,nombre,revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R2';

--c)
--Creo una revista intermedia R5, para hacer un intercambio circular de valores de codigo de revista

ALTER TABLE PERIODISTA_PLANTILLA
 DISABLE CONSTRAINT p_plantilla_fk_revista;
 

UPDATE PERIODISTA_PLANTILLA
 SET revista = 'R5' WHERE revista = 'R2';

UPDATE PERIODISTA_PLANTILLA
 SET revista = 'R2' WHERE revista = 'R1';
 
UPDATE PERIODISTA_PLANTILLA
 SET revista = 'R1' WHERE revista = 'R5';


DELETE FROM REVISTA
  WHERE identificador = 'R5';
  
--d)  
SELECT dni, nombre, revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R1';

SELECT dni, nombre, revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R2';


--e)
ROLLBACK;

-- El rollback se ha ejecutado sin problema,los periodista_plantilla han vuelto a las revistas originales, comprobacion:
--Mostramos la revista R1
SELECT dni,nombre,revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R1';

--Mostramos la revista R2
SELECT dni,nombre,revista
FROM PERIODISTA_PLANTILLA
WHERE revista = 'R2';
  
ALTER TABLE PERIODISTA_PLANTILLA
 ENABLE CONSTRAINT p_plantilla_fk_revista;  
