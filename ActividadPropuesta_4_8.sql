<<<<<<< HEAD
CREATE TABLE PROFESOR4_8 (
    DNI VARCHAR2 (9),
    NOMBRE VARCHAR2 (30),
    APELLIDO1 VARCHAR2 (30),
    APELLIDO2 VARCHAR2 (30) NULL,
    DIRECCION VARCHAR2 (50), 
    CUENTA VARCHAR2 (26),
    TELEFONO NUMBER (9),
    CONSTRAINT pk_profesor4_8 PRIMARY KEY (DNI)
);

CREATE TABLE CICLO_FORMATIVO4_8 (
    CODCICLO NUMBER (20) NOT NULL,
    NOMBRE VARCHAR2 (20) NOT NULL,
    TIPO VARCHAR2 (20) NOT NULL,
    CONSTRAINT pk_cicloformativo4_8 PRIMARY KEY (CODCICLO)
);

CREATE TABLE ASIGNATURA4_8 (
    CODASIG VARCHAR2 (20) NOT NULL,
    NOMBRE VARCHAR2 (20) NOT NULL,
    NUM_HORAS NUMBER (3) NOT NULL,
    CODCICLO NUMBER (20) NOT NULL,
    DNI VARCHAR2 (9),
    CONSTRAINT pk_asignatura2 PRIMARY KEY(CODASIG),
    CONSTRAINT fk_ciclo4_8 FOREIGN KEY (CODCICLO) REFERENCES CICLO_FORMATIVO4_8 (CODCICLO),
    CONSTRAINT fk_prof4_8 FOREIGN KEY (DNI) REFERENCES PROFESOR4_8 (DNI)
);

CREATE TABLE IDIOMA4_8 (
    CODIDIOMA VARCHAR2 (20) NOT NULL,
    DESCRIPCION VARCHAR2 (50) NOT NULL,
    CONSTRAINT pk_codidioma4_8 PRIMARY KEY (CODIDIOMA)
);

CREATE TABLE IDIOMA_PROFESOR4_8 (
    CODIDIOMA VARCHAR2 (20) NOT NULL,
    DNI VARCHAR2 (9),
    CONSTRAINT pk_idiomaprofe4_8 PRIMARY KEY (CODIDIOMA, DNI),
    CONSTRAINT fk_idioma4_8 FOREIGN KEY (CODIDIOMA) REFERENCES IDIOMA4_8 (CODIDIOMA),
    CONSTRAINT fk_profe4_8 FOREIGN KEY (DNI) REFERENCES PROFESOR4_8 (DNI)
);

CREATE TABLE ALUMNO4_8 (
    DNI_ALUMNO VARCHAR2 (9),
    NOMBRE VARCHAR2 (30),
    APELLIDO1 VARCHAR2 (30),
    APELLIDO2 VARCHAR2 (30) NULL,
    DIRECCION VARCHAR2 (50),
    EMAIL VARCHAR2 (30),
    TELEFONO NUMBER (9),
    CODIDIOMA VARCHAR2 (20) NOT NULL,
    CONSTRAINT pk_alumno4_8 PRIMARY KEY (DNI_ALUMNO),
    CONSTRAINT fk_idioma4_8_2 FOREIGN KEY (CODIDIOMA) REFERENCES IDIOMA3_4 (CODIDIOMA) 
);

CREATE TABLE MATRICULA3_4 (
    DNI_ALUMNO VARCHAR2 (9),
    CODASIG VARCHAR2 (20) NOT NULL,
    CONSTRAINT pk_matricula3_4 PRIMARY KEY (CODASIG, DNI_ALUMNO),
    CONSTRAINT fk_asig3_4 FOREIGN KEY (CODASIG) REFERENCES ASIGNATURA4_8 (CODASIG),
    CONSTRAINT fk_alumno3_4 FOREIGN KEY (DNI_ALUMNO) REFERENCES ALUMNO4_8 (DNI_ALUMNO)
);




--UNA VEZ TENEMOS LAS TABLAS CREADAS, LAS MODIFICAMOS



CREATE TABLE DATOS_PERSONALES4_8 (
    DNI VARCHAR2 (9),
    NOMBRE VARCHAR2 (30),
    APELLIDO1 VARCHAR2 (30),
    APELLIDO2 VARCHAR2 (30) NULL,
    DIRECCION VARCHAR2 (50), 
    CUENTA VARCHAR2 (26),
    TELEFONO NUMBER (9),
    TIPO VARCHAR2 (9),
    CONSTRAINT pk_datos_personales4_8 PRIMARY KEY (DNI),
    CONSTRAINT ck_datos_personales4_8 CHECK(TIPO IN('ALUMNO', 'PROFESOR'))
);

ALTER TABLE PROFESOR3_8 DROP COLUMN NOMBRE;
ALTER TABLE PROFESOR3_8 DROP COLUMN APELLIDO1;
ALTER TABLE PROFESOR3_8 DROP COLUMN APELLIDO2;
ALTER TABLE PROFESOR3_8 DROP COLUMN DIRECCION;
ALTER TABLE PROFESOR3_8 DROP COLUMN TELEFONO;

ALTER TABLE ALUMNO3_8 DROP COLUMN NOMBRE;
ALTER TABLE ALUMNO3_8 DROP COLUMN APELLIDO1;
ALTER TABLE ALUMNO3_8 DROP COLUMN APELLIDO2;
ALTER TABLE ALUMNO3_8 DROP COLUMN DIRECCION;
ALTER TABLE ALUMNO3_8 DROP COLUMN TELEFONO;

ALTER TABLE PROFESOR3_8 ADD CONSTRAINT fk_profesor_datos_4_8 FOREIGN KEY (DNI) REFERENCES DATOS_PERSONALES4_8 (DNI);
ALTER TABLE ALUMNO3_8 ADD CONSTRAINT fk_alumno_datos_4_8 FOREIGN KEY (DNI_ALUMNO) REFERENCES DATOS_PERSONALES4_8 (DNI);
=======
CREATE TABLE DATOSPERSONALES (
    DNI VARCHAR2 (9),
    NOMBRE VARCHAR2 (30),
    APE1 VARCHAR2 (50),
    APE2 VARCHAR2 (50) NULL,
    DIRECCION VARCHAR2 (70),
    TELEFONO NUMBER (12),
    TIPO VARCHAR2 (8),
    CONSTRAINT pk_datosPersonales PRIMARY KEY (DNI),
    CONSTRAINT ck_datosPersonales CHECK (TIPO IN ('ALUMNO', 'PROFESOR')),
);

ALTER TABLE PROFESOR DROP COLUMN NOMBRE;
ALTER TABLE PROFESOR DROP COLUMN APE1;
ALTER TABLE PROFESOR DROP COLUMN APE2;
ALTER TABLE PROFESOR DROP COLUMN DIRECCION;
ALTER TABLE PROFESOR DROP COLUMN TELEFONO;

ALTER TABLE ALUMNO DROP COLUMN NOMBRE;
ALTER TABLE ALUMNO DROP COLUMN APE1;
ALTER TABLE ALUMNO DROP COLUMN APE2;
ALTER TABLE ALUMNO DROP COLUMN DIRECCION;
ALTER TABLE ALUMNO DROP COLUMN TELEFONO;

ALTER TABLE PROFESOR ADD CONSTRAINT fk_profesor_datosPersonales FOREIGN KEY (DNI) REFERENCES DATOSPERSONALES (DNI);
ALTER TABLE ALUMNO ADD CONSTRAINT fk_alumno_datosPersonales FOREIGN KEY (DNI) REFERENCES DATOSPERSONALES (DNI);
>>>>>>> 8db0f0c800b544781cc02ecc5ebeb320aec7d887
