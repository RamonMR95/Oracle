-------------------------------------------------------------------------------------------------------
---4. Modificar una clave primaria de manera ordenada: cambiar el DNI de un periodista de plantilla.---
-------------------------------------------------------------------------------------------------------
--Modificacimos el dni del periodista de la plantilla '74185296T' por '666666666'

ALTER TABLE REVISTA
  DISABLE CONSTRAINT revista_fk_p_plantilla;

ALTER TABLE ARTICULO
  DISABLE CONSTRAINT articulo_fk_p_plantilla;
  
ALTER TABLE PERIODISTA_PLANTILLA
  DISABLE CONSTRAINT p_plantilla_fk_p_plantilla;
 
  
UPDATE PERIODISTA_PLANTILLA
  SET dni = '666666666'
  WHERE dni = '74185296T';
  
UPDATE PERIODISTA_PLANTILLA
   SET tutor = '666666666'
  WHERE tutor = '74185296T'; 
  
UPDATE ARTICULO
  SET periodista_plantilla = '666666666'
  WHERE periodista_plantilla = '74185296T';
  
UPDATE REVISTA
  SET coordinador = '666666666'
  WHERE coordinador = '74185296T';
  
  
ALTER TABLE REVISTA
  ENABLE CONSTRAINT revista_fk_p_plantilla;
  
ALTER TABLE ARTICULO
  ENABLE CONSTRAINT articulo_fk_p_plantilla;
  
ALTER TABLE PERIODISTA_PLANTILLA
  ENABLE CONSTRAINT p_plantilla_fk_p_plantilla;
  

COMMIT;
