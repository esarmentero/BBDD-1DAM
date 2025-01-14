CREATE TABLE CLIENTE(
    NOMBRE VARCHAR2(20),
    APELLIDO1 VARCHAR2(30),
    APELLIDO2 VARCHAR2(30) NULL,
    DOMICILIO VARCHAR2(40),
    NUMTARJETA NUMBER(9),
    DNICLIENTE VARCHAR2(9),
    CONSTRAINT pk_cliente PRIMARY KEY (DNICLIENTE)
);

CREATE TABLE FABRICANTE(
    FABRICANTE VARCHAR2(20),
    CODFABRICANTE VARCHAR2(20),
    CONSTRAINT pk_fabricante PRIMARY KEY (CODFABRICANTE)
);

CREATE TABLE MARCA(
    MARCA VARCHAR2(20),
    CODMARCA VARCHAR2(20),
    CONSTRAINT pk_marca PRIMARY KEY (CODMARCA)
);

CREATE TABLE VEHICULO(
    MODELO VARCHAR2(30),
    TIPO VARCHAR2(20),
    COLOR VARCHAR2(15),
    CODFABRICANTE VARCHAR2(20),
    CODMARCA VARCHAR2(20),
    CODVEHICULO VARCHAR2 (20),
    CONSTRAINT pk_vehiculo PRIMARY KEY (CODVEHICULO),
    CONSTRAINT fk_fabricante FOREIGN KEY (CODFABRICANTE) REFERENCES FABRICANTE (CODFABRICANTE),
    CONSTRAINT fk_marca FOREIGN KEY (CODMARCA) REFERENCES MARCA (CODMARCA)
);

CREATE TABLE CURSO(
    DESCRIPCION VARCHAR2(50),
    NUMHORAS NUMBER(3),
    FECHA DATE,
    CODCURSO VARCHAR2(20),
    CONSTRAINT pk_curso PRIMARY KEY (CODCURSO)
);

CREATE TABLE EMPLEADO(
    NOMBRE VARCHAR2(20),
    APELLIDO1 VARCHAR(30),
    APELLIDO2 VARCHAR2(30) NULL,
    DOMICILIO VARCHAR2(40),
    NUMCUENTA VARCHAR2(20),
    DNIEMPLEADO VARCHAR2(9),
    CONSTRAINT pk_empleado PRIMARY KEY (DNIEMPLEADO)
);

CREATE TABLE CURSOEMPLEADO(
    DNIEMPLEADO VARCHAR2(9),
    CODCURSO VARCHAR2(20),
    CONSTRAINT pk_cursoempleado PRIMARY KEY (DNIEMPLEADO, CODCURSO),
    CONSTRAINT fk_empleado FOREIGN KEY (DNIEMPLEADO) REFERENCES EMPLEADO (DNIEMPLEADO),
    CONSTRAINT fk_curso FOREIGN KEY (CODCURSO) REFERENCES CURSO (CODCURSO)
);

CREATE TABLE OFICINA(
    DOMICILIO VARCHAR2(40),
    TELEFONO NUMBER(9),
    CODOFICINALLEGADA VARCHAR2(20),
    CODOFICINASALIDA VARCHAR2(20),
    CONSTRAINT pk_oficina PRIMARY KEY (CODOFICINALLEGADA, CODOFICINASALIDA)
);

CREATE TABLE ALQUILER(
    FECHA DATE,
    NUMDIAS NUMBER(3),
    KMACTUAL VARCHAR2(10),
    KMENTREGA VARCHAR2(10),
    CODALQUILER VARCHAR2(20),
    DNICLIENTE VARCHAR2(9) NULL,
    DNIEMPLEADO VARCHAR2(9),
    CODVEHICULO VARCHAR2(20) NULL,
    CONSTRAINT pk_alquiler PRIMARY KEY (CODALQUILER),
    CONSTRAINT fk_empleadoalquiler FOREIGN KEY (DNIEMPLEADO) REFERENCES EMPLEADO (DNIEMPLEADO),
    CONSTRAINT fk_clientealquiler FOREIGN KEY (DNICLIENTE) REFERENCES CLIENTE (DNICLIENTE),
    CONSTRAINT fk_vehiculoalquiler FOREIGN KEY (CODVEHICULO) REFERENCES VEHICULO (CODVEHICULO)
);

CREATE TABLE OFICINASALQUILER(
    CODOFICINASALIDA VARCHAR2(20),
    CODOFICINALLEGADA VARCHAR2(20),
    CODALQUILER VARCHAR2(20),
    CONSTRAINT pk_oficinaslalquiler PRIMARY KEY (CODOFICINASALIDA, CODOFICINALLEGADA, CODALQUILER),
    CONSTRAINT fk_oficinasalquiler FOREIGN KEY (CODOFICINASALIDA, CODOFICINALLEGADA) REFERENCES OFICINA (CODOFICINALLEGADA, CODOFICINASALIDA),
    CONSTRAINT fk_alquileroficinasalquiler FOREIGN KEY (CODALQUILER) REFERENCES ALQUILER (CODALQUILER)
);