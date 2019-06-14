/*
DELETE FROM REVISTA;
DELETE FROM PERIODISTA_FREELANCE;
DELETE FROM PERIODISTA_PLANTILLA;
DELETE FROM COLABORACION;
DELETE FROM ARTICULO;
DELETE FROM SECCION_REVISTA;
DELETE FROM NUMERO_REVISTA;

*/
------------------------------------------------------------------
--------1. Insertar varias filas en las tablas del esquema--------
------------------------------------------------------------------


--INSERCION EN LA TABLA PERIODISTA_FREELANCE
INSERT INTO PERIODISTA_FREELANCE (dni, nombre, email, especialidad)
  VALUES ('12345678P', 'Carlos', 'carlospf@gmail.com', 'economia');
INSERT INTO PERIODISTA_FREELANCE (dni, nombre, email, especialidad)
  VALUES ('87654321X', 'Diego', 'diegopf@gmail.com', 'educacion');
INSERT INTO PERIODISTA_FREELANCE (dni, nombre, email, especialidad)
  VALUES ('25153678Y', 'Alberto', 'albertopf@gmail.com', 'viajes');
INSERT INTO PERIODISTA_FREELANCE (dni, nombre, email, especialidad)
  VALUES ('12457898U', 'Victor', 'victorpf@gmail.com', 'aventura');

--INSERCION EN REVISTA
ALTER TABLE REVISTA
  DISABLE CONSTRAINT revista_fk_p_plantilla; 

ALTER TABLE PERIODISTA_PLANTILLA
  DISABLE CONSTRAINT p_plantilla_fk_revista; 
  

  
INSERT INTO REVISTA (identificador, nombre, tema, web, periodicidad, coordinador)
  VALUES ('R1', 'muy interesante', 'ciencia', 'www.muyinteresante.es', 'semanal', '15260348Y');
INSERT INTO REVISTA (identificador, nombre, tema, web, periodicidad, coordinador)
  VALUES ('R2', 'saber vivir', 'salud', 'www.sabervivir.es', 'semanal', '74185296T');
INSERT INTO REVISTA (identificador, nombre, tema, web, periodicidad, coordinador)
  VALUES ('R3', 'national geographic', 'aventura', 'www.nationalgeographic.es', 'mensual', '25368945M');
INSERT INTO REVISTA (identificador, nombre, tema, web, periodicidad, coordinador)
  VALUES ('R4', 'traveler', 'viajes', 'www.traveler.es', 'anual', '36251478K');
  

--INSERCION EN LA TABLA PERIODISTA_PLANTILLA
ALTER TABLE PERIODISTA_PLANTILLA
   DISABLE CONSTRAINT p_plantilla_fk_p_plantilla;
  
INSERT INTO PERIODISTA_PLANTILLA (dni, nombre, email, sueldo, revista, fecha_contrato, tutor)
  VALUES ('15260348Y', 'Rafa', 'radapp@gmail.com', 5000, 'R1', 	TO_DATE('18-07-2012', 'DD-MM-YYYY'), '74185296T');
  INSERT INTO PERIODISTA_PLANTILLA (dni, nombre, email, sueldo, revista, fecha_contrato, tutor)
  VALUES ('15262222Y', 'Raul', 'raulpp@gmail.com', 2500, 'R1', 	TO_DATE('15-07-2012', 'DD-MM-YYYY'), '74185296T');
INSERT INTO PERIODISTA_PLANTILLA (dni, nombre, email, sueldo, revista, fecha_contrato, tutor)
  VALUES ('74185296T', 'Daniel', 'danielpp@gmail.com', 6000, 'R2', TO_DATE('06-01-2010', 'DD-MM-YYYY'),'15260348Y');
  

  
  
INSERT INTO PERIODISTA_PLANTILLA (dni, nombre, email, sueldo, revista, fecha_contrato, tutor)
  VALUES ('25368945M', 'Julio', 'juliopp@gmail.com', 2500, 'R3', TO_DATE('01-05-2008', 'DD-MM-YYYY'),'74185296T');
INSERT INTO PERIODISTA_PLANTILLA (dni, nombre, email, sueldo, revista, fecha_contrato, tutor)
  VALUES ('36251478K', 'Arnau', 'arnaupp@gmail.com', 100, 'R4', TO_DATE('21-07-2006', 'DD-MM-YYYY'),'25368945M');

ALTER TABLE PERIODISTA_PLANTILLA
   ENABLE CONSTRAINT p_plantilla_fk_p_plantilla;

ALTER TABLE REVISTA
  ENABLE CONSTRAINT revista_fk_p_plantilla; 
  
ALTER TABLE PERIODISTA_PLANTILLA
  ENABLE CONSTRAINT p_plantilla_fk_revista; 
  
--INSERCION EN LA TABLA NUMERO_REVISTA
--REVISTA 1 R1
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (1, TO_DATE('01-05-2016', 'DD-MM-YYYY'),'R1', 2);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (2, TO_DATE('08-05-2016', 'DD-MM-YYYY'),'R1', 4);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (3, TO_DATE('15-05-2016', 'DD-MM-YYYY'),'R1', 1);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (4, TO_DATE('22-05-2016', 'DD-MM-YYYY'),'R1', 2);

--REVISTA 2 R2
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (1, TO_DATE('01-05-2016', 'DD-MM-YYYY'),'R2', 3);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (2, TO_DATE('08-05-2016', 'DD-MM-YYYY'),'R2', 1);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (3, TO_DATE('15-05-2016', 'DD-MM-YYYY'),'R2', 2);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (4, TO_DATE('22-05-2016', 'DD-MM-YYYY'),'R2', 2);

--REVISTA 3 R3
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (1, TO_DATE('01-05-2016', 'DD-MM-YYYY'),'R3', 2);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (2, TO_DATE('01-06-2016', 'DD-MM-YYYY'),'R3', 4);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (3, TO_DATE('01-07-2016', 'DD-MM-YYYY'),'R3', 1);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (4, TO_DATE('01-08-2016', 'DD-MM-YYYY'),'R3', 5);

--REVISTA 4 R4  
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (1, TO_DATE('01-05-2015', 'DD-MM-YYYY'),'R4', 2);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (2, TO_DATE('01-05-2016', 'DD-MM-YYYY'),'R4', 4);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (3, TO_DATE('01-05-2017', 'DD-MM-YYYY'),'R4', 1);
INSERT INTO NUMERO_REVISTA (numero, fecha_publicacion, revista, secciones)
  VALUES (4, TO_DATE('01-05-2018', 'DD-MM-YYYY'),'R4', 5);
  
--INSERCION EN LA TABLA SECCION_REVISTA
--R4
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1','la entrevista', 1, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 1, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 1, 'R4');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec1','la entrevista', 2, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 2, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec3', 'no te lo pierdas', 2, 'R4');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1','la entrevista', 3, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec2','novedades', 3, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec3', 'no te lo pierdas', 3, 'R4');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec1','la entrevista', 4, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec2','novedades', 4, 'R4');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec3', 'no te lo pierdas', 4, 'R4');
  


--R3
INSERT INTO SECCION_REVISTA (codigo, nombre, numero,  revista)
  VALUES ('sec1', 'la entrevista', 1, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 1, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 1, 'R3');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 2, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 2, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 2, 'R3');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 3, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 3, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 3, 'R3');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 4, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 4, 'R3');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 4, 'R3');
  
  
  
  
 --R2 
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 1, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 1, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 1, 'R2');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 2, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 2, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 2, 'R2');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 3, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 3, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 3, 'R2');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 4, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 4, 'R2');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 4, 'R2');
  
  
 
--R1  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 1, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 1, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 1, 'R1');
  
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 2, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 2, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 2, 'R1');

INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista',3, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 3, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 3, 'R1');

INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec1', 'la entrevista', 4, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec2', 'novedades', 4, 'R1');
INSERT INTO SECCION_REVISTA (codigo, nombre, numero, revista)
  VALUES ('sec3', 'no te lo pierdas', 4, 'R1');
  


--SECCION R1 1

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART1', 'Robo', 'noticia', NULL, '15262222Y', 'sec1', 'R1', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART2', 'Quijote', 'editorial', NULL, '15260348Y', 'sec1', 'R1', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART4', 'Robo', 'noticia', NULL, '15260348Y', 'sec2', 'R1', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART5', 'Quijote', 'editorial', NULL, '15262222Y', 'sec2', 'R1', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART6', 'Quijote', 'editorial', NULL, '15260348Y', 'sec3', 'R1', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART7', 'Robo', 'noticia', NULL, '15262222Y', 'sec3', 'R1', 1);



--SECCION R1 2

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART8', 'Robo', 'noticia', NULL, '15260348Y', 'sec1', 'R1', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART9', 'Quijote', 'editorial', NULL, '15260348Y', 'sec1', 'R1', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART10', 'Robo', 'noticia', NULL, '15260348Y', 'sec2', 'R1', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART11', 'Quijote', 'editorial', NULL, '15262222Y', 'sec2', 'R1', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART12', 'Quijote', 'editorial', NULL, '15260348Y', 'sec3', 'R1', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART13', 'Robo', 'noticia', NULL, '15260348Y', 'sec3', 'R1', 2);

--SECCION R1 3

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART14', 'Robo', 'noticia', NULL, '15260348Y', 'sec1', 'R1', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART15', 'Quijote', 'editorial', NULL, '15260348Y', 'sec1', 'R1', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART16', 'Robo', 'noticia', '87654321X', NULL, 'sec2', 'R1', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART17', 'Quijote', 'editorial', NULL, '15260348Y', 'sec2', 'R1', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART18', 'Quijote', 'editorial', NULL, '15260348Y', 'sec3', 'R1', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART19', 'Robo', 'noticia', NULL, '15260348Y', 'sec3', 'R1', 3);



--SECCION R1 4

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART20', 'Robo', 'noticia', NULL, '15260348Y', 'sec1', 'R1', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART21', 'Quijote', 'editorial', NULL, '15260348Y', 'sec1', 'R1', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART22', 'Robo', 'noticia', NULL, '15260348Y', 'sec2', 'R1', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART23', 'Quijote', 'editorial', '12345678P', NULL, 'sec2', 'R1', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART24', 'Quijote', 'editorial', NULL, '15260348Y', 'sec3', 'R1', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART25', 'Robo', 'noticia', NULL, '15260348Y', 'sec3', 'R1', 4);



--SECCION R2 1

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART26', 'Robo', 'noticia', NULL, '74185296T', 'sec1', 'R2', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART27', 'Quijote', 'editorial', '12457898U', NULL, 'sec1', 'R2', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART28', 'Robo', 'noticia', NULL, '74185296T', 'sec2', 'R2', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART29', 'Quijote', 'editorial', NULL, '74185296T', 'sec2', 'R2', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART30', 'Quijote', 'editorial', NULL, '74185296T', 'sec3', 'R2', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART31', 'Robo', 'noticia', NULL, '74185296T', 'sec3', 'R2', 1);


--SECCION R2 2

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART32', 'Robo', 'noticia', NULL, '74185296T', 'sec1', 'R2', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART33', 'Quijote', 'editorial', NULL, '74185296T', 'sec1', 'R2', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART34', 'Robo', 'noticia', NULL, '74185296T', 'sec2', 'R2', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART35', 'Quijote', 'editorial', NULL, '74185296T', 'sec2', 'R2', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART36', 'Quijote', 'editorial', NULL, '74185296T', 'sec3', 'R2', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART37', 'Robo', 'noticia', NULL, '74185296T', 'sec3', 'R2', 2);


--SECCION R2 3

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART38', 'Robo', 'noticia','12345678P', NULL, 'sec1', 'R2', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART39', 'Quijote', 'editorial', NULL, '74185296T', 'sec1', 'R2', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART40', 'Robo', 'noticia', NULL, '74185296T', 'sec2', 'R2', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART41', 'Quijote', 'editorial', NULL, '74185296T', 'sec2', 'R2', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART42', 'Quijote', 'editorial', NULL, '74185296T', 'sec3', 'R2', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART43', 'Robo', 'noticia', NULL, '74185296T', 'sec3', 'R2', 3);



--SECCION R2 4

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART44', 'Robo', 'noticia', NULL, '74185296T', 'sec1', 'R2', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART45', 'Quijote', 'editorial', NULL, '74185296T', 'sec1', 'R2', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART46', 'Robo', 'noticia', NULL, '74185296T', 'sec2', 'R2', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART47', 'Quijote', 'editorial', NULL, '74185296T', 'sec2', 'R2', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART48', 'Quijote', 'editorial', '12457898U', NULL, 'sec3', 'R2', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART49', 'Robo', 'noticia', NULL, '74185296T', 'sec3', 'R2', 4);


--SECCION R3 1

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART50', 'Robo', 'noticia', NULL, '25368945M', 'sec1', 'R3', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART51', 'Quijote', 'editorial', NULL, '25368945M', 'sec1', 'R3', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART52', 'Robo', 'noticia', NULL, '25368945M', 'sec2', 'R3', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART53', 'Quijote', 'editorial', NULL, '25368945M', 'sec2', 'R3', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART54', 'Quijote', 'editorial', NULL, '25368945M', 'sec3', 'R3', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART55', 'Robo', 'noticia', NULL, '25368945M', 'sec3', 'R3', 1);


--SECCION R3 2

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART56', 'Robo', 'noticia', NULL, '25368945M', 'sec1', 'R3', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART57', 'Quijote', 'editorial', NULL, '25368945M', 'sec1', 'R3', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART58', 'Robo', 'noticia', NULL, '25368945M', 'sec2', 'R3', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART59', 'Quijote', 'editorial', NULL, '25368945M', 'sec2', 'R3', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART60', 'Quijote', 'editorial', NULL, '25368945M', 'sec3', 'R3', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART61', 'Robo', 'noticia', NULL, '25368945M', 'sec3', 'R3', 2);


--SECCION R3 3

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART62', 'Robo', 'noticia','12345678P', NULL, 'sec1', 'R3', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART63', 'Quijote', 'editorial', NULL, '25368945M', 'sec1', 'R3', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART64', 'Robo', 'noticia', NULL, '25368945M', 'sec2', 'R3', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART65', 'Quijote', 'editorial', NULL, '25368945M', 'sec2', 'R3', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART66', 'Quijote', 'editorial', NULL, '25368945M', 'sec3', 'R3', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART67', 'Robo', 'noticia', '25153678Y', NULL, 'sec3', 'R3', 3);

--SECCION R3 4

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART68', 'Robo', 'noticia', NULL, '25368945M', 'sec1', 'R3', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART69', 'Quijote', 'editorial', NULL, '25368945M', 'sec1', 'R3', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART70', 'Robo', 'noticia', NULL, '25368945M', 'sec2', 'R3', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART71', 'Quijote', 'editorial', NULL, '25368945M', 'sec2', 'R3', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART72', 'Quijote', 'editorial', NULL, '25368945M', 'sec3', 'R3', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART73', 'Robo', 'noticia', '87654321X', NULL, 'sec3', 'R3', 4);




--SECCION R4 1

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART98', 'Robo', 'noticia', NULL, '36251478K', 'sec1', 'R4', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART99', 'Quijote', 'editorial', NULL, '36251478K', 'sec1', 'R4', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART100', 'Robo', 'noticia', NULL, '36251478K', 'sec2', 'R4', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART101', 'Quijote', 'editorial', NULL, '36251478K', 'sec2', 'R4', 1);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART102', 'Quijote', 'editorial', NULL, '36251478K', 'sec3', 'R4', 1);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART103', 'Robo', 'noticia', NULL, '36251478K', 'sec3', 'R4', 1);



--SECCION R1 2

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART104', 'Robo', 'noticia', NULL, '36251478K', 'sec1', 'R4', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART105', 'Quijote', 'editorial', NULL, '36251478K', 'sec1', 'R4', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART106', 'Robo', 'noticia', NULL, '36251478K', 'sec2', 'R4', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART107', 'Quijote', 'editorial', NULL, '36251478K', 'sec2', 'R4', 2);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART108', 'Quijote', 'editorial', NULL, '36251478K', 'sec3', 'R4', 2);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART109', 'Robo', 'noticia', NULL, '36251478K', 'sec3', 'R4', 2);
  
  
  
  
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART110', 'Robo', 'noticia', NULL, '36251478K', 'sec1', 'R4', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART111', 'Quijote', 'editorial', NULL, '36251478K', 'sec1', 'R4', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART112', 'Robo', 'noticia', NULL, '36251478K', 'sec2', 'R4', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART113', 'Quijote', 'editorial', NULL, '36251478K', 'sec2', 'R4', 3);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART114', 'Quijote', 'editorial', NULL, '36251478K', 'sec3', 'R4', 3);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART115', 'Robo', 'noticia', NULL, '36251478K', 'sec3', 'R4', 3);



INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART116', 'Robo', 'noticia', NULL, '36251478K', 'sec1', 'R4', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART117', 'Quijote', 'editorial', NULL, '36251478K', 'sec1', 'R4', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART118', 'Robo', 'noticia', NULL, '36251478K', 'sec2', 'R4', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART119', 'Quijote', 'editorial', NULL, '36251478K', 'sec2', 'R4', 4);

INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART120', 'Quijote', 'editorial', NULL, '36251478K', 'sec3', 'R4', 4);
INSERT INTO ARTICULO (identificador, titulo, tipo, periodista_freelance, periodista_plantilla, seccion, revista, numero)
  VALUES('ART121', 'Robo', 'noticia', '25153678Y', NULL, 'sec3', 'R4', 4);




  
--COLABORACION

INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('12345678P', 'R1', 3000);
 INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('12345678P', 'R2', 222);
  INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('12345678P', 'R3', 2222);
 
 INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('87654321X', 'R1', 322);
 INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('87654321X', 'R3', 4444);
 
  INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('25153678Y', 'R4', 3222);
 INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('25153678Y', 'R3', 4323);
 
INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('12457898U', 'R2', 1111);
INSERT INTO COLABORACION (periodista_freelance, revista, pago)
 VALUES('12457898U', 'R1', 4333);
 
 COMMIT;