CREATE TABLE SEDE_4 (
    CODSEDE VARCHAR2(30),
    NOMBRE VARCHAR2(20),
    DIRECCION VARCHAR2(30),
    CONSTRAINT pk_sede_4 PRIMARY KEY (CODSEDE)
);

CREATE TABLE DEPARTAMENTO_4(
    CODDEPARTAMENTO VARCHAR2(30),
    NOMBRE VARCHAR2(30),
    UBICACION VARCHAR2(30),
    CODSEDE VARCHAR2(30),
    CONSTRAINT pk_departamento_4 PRIMARY KEY (CODDEPARTAMENTO, CODSEDE),
    CONSTRAINT fk_departamento_4 FOREIGN KEY (CODSEDE) REFERENCES SEDE_4 (CODSEDE) 
);

CREATE TABLE PROGRAMADOR_4 (
    SECUENCIA VARCHAR2(20),
    NOMBRE VARCHAR2(30),
    APELLIDO1 VARCHAR2(30),
    APELLIDO2 VARCHAR2(20) NULL,
    DIRECCION VARCHAR2(30),
    CUENTA VARCHAR2(30),
    TELEFONO NUMBER(5), 
    TIPO VARCHAR2(20),
    CODSEDE VARCHAR2(30),
    CODDEPARTAMENTO VARCHAR2(30),
	SECUENCIA_MENTOR VARCHAR2(20),
	CODSEDE_MENTOR VARCHAR2(30),
	CODEPARTAMENTO_MENTOR VARCHAR2(30),
    CONSTRAINT pk_programador_4 PRIMARY KEY (SECUENCIA,CODSEDE,CODDEPARTAMENTO),
    CONSTRAINT fk_codsede_coddepartamento_4 FOREIGN KEY (CODSEDE, CODDEPARTAMENTO) REFERENCES DEPARTAMENTO_4(CODSEDE, CODDEPARTAMENTO),
    CONSTRAINT fk_mentor_4 FOREIGN KEY (SECUENCIA_MENTOR,CODSEDE_MENTOR,CODEPARTAMENTO_MENTOR) REFERENCES PROGRAMADOR_4 (SECUENCIA,CODSEDE,CODDEPARTAMENTO)
);


CREATE TABLE EQUIPO_4 (
    CODEQUIPO_4 NUMBER(3),
    DESCRIPCION VARCHAR2(23),
    SECUENCIA VARCHAR2(30),
    CODSEDE VARCHAR2(30),
    CODDEPARTAMENTO VARCHAR2(30),
    CONSTRAINT pk_equipo_4 PRIMARY KEY (CODEQUIPO_4),
    CONSTRAINT fk_equipo_4 FOREIGN KEY (SECUENCIA,CODSEDE,CODDEPARTAMENTO) REFERENCES PROGRAMADOR_4 (SECUENCIA,CODSEDE,CODDEPARTAMENTO)
);


CREATE TABLE EQUIPOPROG_4 (
    SECUENCIA VARCHAR2(20),
    CODEQUIPO_4 NUMBER(3),
    CODSEDE VARCHAR2(30),
    CODDEPARTAMENTO VARCHAR2(30),
    CONSTRAINT pk_equipoprog_4 PRIMARY KEY (SECUENCIA,CODEQUIPO_4,CODSEDE,CODDEPARTAMENTO),
    CONSTRAINT fk_equipoprog_4_1 FOREIGN KEY (CODEQUIPO_4) REFERENCES EQUIPO_4(CODEQUIPO_4),
    CONSTRAINT fk_equipoprog_4_2 FOREIGN KEY (SECUENCIA,CODSEDE,CODDEPARTAMENTO) REFERENCES PROGRAMADOR(SECUENCIA,CODSEDE,CODDEPARTAMENTO)
);
CREATE TABLE PROYECTO_4_1 (
    FECHAINICIO DATE,
    DESCRIPCION VARCHAR2(30),
    FECHAFINAL DATE NULL,
    CODEQUIPO NUMBER(3),
    FECHAINICIO_SUBPROYECTO DATE,
	CODEQUIPO_SUBPROYECTO NUMBER(3),
    CONSTRAINT pk_proyecto_4 PRIMARY KEY (FECHAINICIO, CODEQUIPO),
    CONSTRAINT fk_proyecto_equipo FOREIGN KEY (CODEQUIPO) REFERENCES EQUIPO_4(CODEQUIPO_4),
    CONSTRAINT fk_proyecto_parteproyecto FOREIGN KEY (FECHAINICIO_SUBPROYECTO, CODEQUIPO_SUBPROYECTO) REFERENCES PROYECTO_4_1(FECHAINICIO, CODEQUIPO)
);
