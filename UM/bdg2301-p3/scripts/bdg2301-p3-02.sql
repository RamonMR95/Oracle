/*
2. Insertar comentarios en una tabla y en una columna.
a- Investigue la sentencia COMMENT de Oracle (anexos de teoría o manuales oficiales). A continuación, crear
en la BD los comentarios (COMMENT) de la tabla ARTICULO (para explicar qué contiene) y de todas las
columnas de la tabla REVISTA (explicando el significado de cada columna).
b- Comprobar la creación correcta de los comentarios anteriores, mostrando por pantalla un par de
SELECT sobre las vistas del diccionario de datos denominadas USER_TAB_COMMENTS y
USER_COL_COMMENTS.
c- Investigue: ¿Se considera en Oracle un comentario como una sentencia en lenguaje de definición de
datos (LDD)? ¿Qué implicaciones tiene, por tanto, desde el punto de vista de las transacciones? 
*/
--a
COMMENT ON TABLE ARTICULO IS 'La tabla articulo contiene el identificador del articulo, codigo, titulo, tipo, pp, pf, seccion de la revista, revista y numero.';


COMMENT ON COLUMN REVISTA.identificador IS 'Identificador de la revista';
COMMENT ON COLUMN REVISTA.nombre IS 'Nombre de la revista';
COMMENT ON COLUMN REVISTA.tema IS 'Tema de la revista';
COMMENT ON COLUMN REVISTA.web IS 'Web de la revista';
COMMENT ON COLUMN REVISTA.periodicidad IS 'Periodicidad de publicación de la revista';
COMMENT ON COLUMN REVISTA.coordinador IS 'Coordinador de la revista';

--b
SELECT comments
FROM   user_tab_comments
WHERE  table_name  = 'ARTICULO';

SELECT * 
FROM user_col_comments
WHERE table_name = 'REVISTA';

--c
/* No, los comentarios son una simple descripción del contenido de una columna/tabla, son metadatos. */
