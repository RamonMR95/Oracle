/*
10. Crear y cargar una tabla, y modificar (alterar) su estructura.
a- Crear una nueva tabla llamada PUBLICACION como un resumen de los datos contenidos en otras tablas del
esquema, de modo que para cada revista almacene su c�digo, su nombre y cu�ntos periodistas de
plantilla tiene contratados.
Columnas de la tabla: (id_revista, nom_revista, cuantos_periodistas) 
*/
DROP TABLE PUBLICACION;
CREATE TABLE PUBLICACION (id_revista, nom_revista, cuantos_periodistas)
AS SELECT R.identificador,R.nombre, COUNT(*) AS cuantos_periodistas
FROM REVISTA R, PERIODISTA_PLANTILLA PP
WHERE R.identificador = PP.revista
GROUP BY R.identificador, R.nombre
HAVING COUNT(*) IN (SELECT COUNT(*)
                    FROM REVISTA R, PERIODISTA_PLANTILLA PP
                    WHERE R.identificador = PP.revista
                    GROUP BY R.identificador, R.nombre);
                    
--b- Mostrar con SELECT el contenido (todas las columnas) de la tabla PUBLICACION, ordenado por c�digo de revista. 
SELECT *
FROM PUBLICACION
ORDER BY id_revista;

/* c- A�adir a la tabla una columna llamada cuantos_articulos destinada a contener el n�mero de
art�culos publicados por cada revista a lo largo del tiempo. Elegir el tipo de datos y tama�o
adecuados. El valor por defecto de esa columna ser� 0 */
ALTER TABLE PUBLICACION
  ADD (cuantos_articulos NUMBER(3) DEFAULT (0));
  
/* d- Utilice una sentencia UPDATE para actualizar el valor de cuantos_articulos (simult�neamente para
todas las filas, sean las que sean, haya las que haya) con el n�mero actual de art�culos de cada revista. */
UPDATE PUBLICACION
  SET cuantos_articulos = (SELECT COUNT(*)
                            FROM ARTICULO
                            GROUP BY revista);
                            
/* e- Volver a mostrar con SELECT el contenido de la tabla y comprobar que los datos son correctos. */                            
SELECT *
FROM PUBLICACION
ORDER BY id_revista;