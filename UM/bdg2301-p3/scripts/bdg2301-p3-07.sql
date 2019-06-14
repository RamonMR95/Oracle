-------------------------------------------------------------------------------------------------------
--------------------------------------7. Borrar una revista--------------------------------------------
-------------------------------------------------------------------------------------------------------
--a) Revista R1

--b)

ALTER TABLE ARTICULO 
 DISABLE CONSTRAINT articulo_fk_p_plantilla;
 
ALTER TABLE SECCION_REVISTA
  DISABLE CONSTRAINT s_revista_fk_n_revista;
  
ALTER TABLE NUMERO_REVISTA
  DISABLE CONSTRAINT n_revista_fk_revista;
  
ALTER TABLE COLABORACION
  DISABLE CONSTRAINT colaboracion_fk_revista;
  
ALTER TABLE PERIODISTA_PLANTILLA
  DISABLE CONSTRAINT p_plantilla_fk_revista;
  
ALTER TABLE PERIODISTA_PLANTILLA
  DISABLE CONSTRAINT p_plantilla_fk_p_plantilla;

ALTER TABLE REVISTA
  DISABLE CONSTRAINT revista_fk_p_plantilla;
  

  
  
  
DELETE FROM ARTICULO
  WHERE revista = 'R1';
  
DELETE FROM SECCION_REVISTA 
   WHERE revista = 'R1';
   
DELETE FROM NUMERO_REVISTA
  WHERE revista = 'R1';
  
DELETE FROM COLABORACION
  WHERE revista = 'R1';

DELETE FROM PERIODISTA_PLANTILLA
 WHERE revista = 'R1';
  
DELETE FROM REVISTA
  WHERE identificador = 'R1';
 
 
  
ALTER TABLE ARTICULO 
 ENABLE CONSTRAINT articulo_fk_p_plantilla;
 
ALTER TABLE SECCION_REVISTA
   ENABLE CONSTRAINT s_revista_fk_n_revista;
  
ALTER TABLE NUMERO_REVISTA
   ENABLE CONSTRAINT n_revista_fk_revista;
  
ALTER TABLE COLABORACION
   ENABLE CONSTRAINT colaboracion_fk_revista;
  
ALTER TABLE PERIODISTA_PLANTILLA
   ENABLE CONSTRAINT p_plantilla_fk_revista;
  
ALTER TABLE PERIODISTA_PLANTILLA
  DISABLE CONSTRAINT p_plantilla_fk_p_plantilla;

ALTER TABLE REVISTA
  DISABLE CONSTRAINT revista_fk_p_plantilla;


  

  

