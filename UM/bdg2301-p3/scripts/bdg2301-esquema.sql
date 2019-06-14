/*
DROP TABLE ARTICULO cascade constraints;
DROP TABLE COLABORACION cascade constraints;
DROP TABLE NUMERO_REVISTA cascade constraints;
DROP TABLE PERIODISTA_FREELANCE cascade constraints;
DROP TABLE PERIODISTA_PLANTILLA cascade constraints;
DROP TABLE REVISTA cascade constraints;
DROP TABLE SECCION_REVISTA cascade constraints;
*/

CREATE TABLE PERIODISTA_FREELANCE(
	dni CHAR(9) NOT NULL,
	nombre VARCHAR2(25) NOT NULL,
	email VARCHAR2(25) NULL,
	especialidad VARCHAR2(50) NOT NULL,
	CONSTRAINT p_freelance_pk PRIMARY KEY (dni),
	CONSTRAINT p_freelance_ak UNIQUE(email),
  
  CONSTRAINT especialidad_ok CHECK (especialidad IN ('economia', 'educacion', 'viajes', 'aventura'))
  
);

CREATE TABLE REVISTA(
  identificador CHAR(9) NOT NULL,
  nombre VARCHAR2(30) NOT NULL,
  tema VARCHAR2(30)NOT NULL,
  web VARCHAR2(30) NULL,
  periodicidad VARCHAR2(30) NOT NULL,
  coordinador CHAR(9) NOT NULL,
  
  CONSTRAINT revista_pk PRIMARY KEY (identificador),
  CONSTRAINT revista_ak UNIQUE(nombre),
  
  CONSTRAINT tema_ok CHECK ( tema IN ('salud', 'pedagogia', 'politica', 'economia', 'viajes', 'ciencia', 'aventura')),
  CONSTRAINT periodicidad_ok CHECK( periodicidad IN ('semanal', 'quincenal', 'mensual', 'bimestral', 'trimestral','anual'))
);

CREATE TABLE PERIODISTA_PLANTILLA(
	dni CHAR(9) NOT NULL,
	nombre VARCHAR2(30) NOT NULL,
	email VARCHAR2(30) NULL,
	sueldo NUMBER(5) NOT NULL,
	revista CHAR(9) NOT NULL,
	fecha_contrato DATE NOT NULL,
	tutor CHAR(9) NULL,

	CONSTRAINT p_plantilla_pk PRIMARY KEY (dni),
	CONSTRAINT p_plantilla_ak UNIQUE(email),
	CONSTRAINT p_plantilla_fk_revista
	  FOREIGN KEY(revista)
	  REFERENCES REVISTA(identificador),
	  --ON DELETE NOACTION ON UPDATE CASCADE
	
	CONSTRAINT p_plantilla_fk_p_plantilla
	  FOREIGN KEY(tutor)
	  REFERENCES PERIODISTA_PLANTILLA(dni),
	 -- ON DELETE SET NULL
   -- ON UPDATE NOACTION
	  
	CONSTRAINT sueldo_pos_ok
		CHECK (sueldo BETWEEN 0 AND 99999)
);
/* Alteración de la tabla REVISTA para añadir las claves foráneas */
ALTER TABLE REVISTA
  ADD CONSTRAINT revista_fk_p_plantilla
    FOREIGN KEY (coordinador)
    REFERENCES PERIODISTA_PLANTILLA(dni)
    --ON DELETE NOACTION ON UPDATE NO ACTION
;
	
	
CREATE TABLE NUMERO_REVISTA(
	numero NUMBER(5) NOT NULL,
	fecha_publicacion DATE NOT NULL,
	revista CHAR(9) NOT NULL,
	secciones NUMBER(3) NOT NULL,

	CONSTRAINT n_revista_pk PRIMARY KEY(numero, revista),
	CONSTRAINT n_revista_fk_revista
		FOREIGN KEY (revista)
		REFERENCES REVISTA(identificador)
		--ON DELETE CASCADE --ON UPDATE CASCADE
	
);  

CREATE TABLE SECCION_REVISTA(
	codigo VARCHAR2(4) NOT NULL,
	nombre VARCHAR2(30) NOT NULL,
	numero NUMBER(5) NOT NULL,
	revista CHAR(9) NOT NULL,

	CONSTRAINT s_revista_pk PRIMARY KEY (codigo, numero, revista),
	CONSTRAINT s_revista_fk_n_revista
		FOREIGN KEY ( numero,revista)
		REFERENCES NUMERO_REVISTA(numero, revista)
		--ON DELETE CASCADE --ON UPDATE CASCADE

);	
/* Atributo calculado secciones */ 
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------

CREATE TABLE COLABORACION(
	periodista_freelance CHAR(9) NOT NULL,
	revista CHAR(9) NOT NULL,
	pago NUMBER(5) NOT NULL,
	
	CONSTRAINT colaboracion_pk PRIMARY KEY (periodista_freelance, revista),
	CONSTRAINT colaboracion_fk_p_freelance
		FOREIGN KEY(periodista_freelance)
		REFERENCES PERIODISTA_FREELANCE(dni),
		--ON DELETE NOACTION ON UPDATE NOACTION
	
	CONSTRAINT colaboracion_fk_revista
		FOREIGN KEY(revista)
		REFERENCES REVISTA(identificador),
	  --ON DELETE NOACTION ON UPDATE CASCADE
  
	CONSTRAINT pago_pos_ok
		CHECK (pago BETWEEN 0 AND 99999)
	
);


CREATE TABLE ARTICULO(
	identificador CHAR(9) NOT NULL,
	titulo VARCHAR2(30) NOT NULL,
	tipo VARCHAR2(30) NOT NULL,
	periodista_freelance CHAR(9) NULL,
	periodista_plantilla CHAR(9) NULL,
	seccion VARCHAR2(4) NOT NULL,
	revista CHAR(9) NOT NULL,
	numero NUMBER(5) NOT NULL,
	
	CONSTRAINT articulo_pk PRIMARY KEY (identificador),
	CONSTRAINT articulo_fk_p_freelance
		FOREIGN KEY(periodista_freelance)
		REFERENCES PERIODISTA_FREELANCE(dni),
     --ON DELETE NOACTION ON UPDATE NOACTION
	
	CONSTRAINT articulo_fk_p_plantilla
		FOREIGN KEY(periodista_plantilla)
		REFERENCES PERIODISTA_PLANTILLA(dni),
		--ON DELETE NO ACTION ON UPDATE NOACTION 
  
	CONSTRAINT articulo_fk_s_revista
		FOREIGN KEY(seccion, numero, revista)
		REFERENCES SECCION_REVISTA(codigo, numero, revista),
		--ON DELETE SET NULL, --ON UPDATE CASCADE
    
  CONSTRAINT tipo_art_ok
    CHECK (tipo IN ('editorial', 'columna', 'noticia', 'cronica', 'reportaje'))
);

COMMIT;