CREATE TABLE DIRECTOR4_3 (
	DIN_DIR VARCHAR2(9),
	NOMBRE VARCHAR2(30),
	APELLIDO1 VARCHAR2(30),
	APELLIDO2 VARCHAR2(30) NULL,
	DOMICILIO VARCHAR(100),
	TELEFONO NUMBER(9),
	EMAIL VARCHAR2(30) NULL,
	CONSTRAINT pk_director4_3 PRIMARY KEY (DNI_DIR)
);

CREATE TABLE SUPERMERCADO4_3 (
	COD_SUP NUMBER (3),
	DIRECCION VARCHAR2(100),
	SUPERFICIE NUMBER (5),
	ALQUILER NUMBER(5),
	FECHA DATE,
	DIN_DIR VARCHAR2(9),
	CONSTRAINT pk_supermercado4_3 PRIMARY KEY (COD_SUP),
	CONSTRAINT fk_director4_3 FOREIGN KEY (DNI_DIR) REFERENCES DIRECTOR4_3 (DNI_DIR),
	CONSTRAINT ck_alquiler4_3 CHECK (ESALQUILER == 0 OR ESALQUILER == 1)
);

CREATE TABLE VENDEDOR4_3 (
	DIN_VEND VARCHAR2(9),
	NOMBRE VARCHAR2(30),
	APELLIDO1 VARCHAR2(30),
	APELLIDO2 VARCHAR2(30) NULL,
	DOMICILIO VARCHAR(100),
	TELEFONO NUMBER(9),
	EMAIL VARCHAR2(30) NULL,
	COD_SUP NUMBER (3),
	CONSTRAINT pk_vendedor4_3 PRIMARY KEY (DNI_VEND),
	CONSTRAINT fk_supermercado4_3 FOREIGN KEY (COD_SUP) REFERENCES SUPERMERCADO4_3 (COD_SUP)
);

CREATE TABLE CLIENTE4_3 (
	DIN_CLI VARCHAR2(9),
	NOMBRE VARCHAR2(30),
	APELLIDO1 VARCHAR2(30),
	APELLIDO2 VARCHAR2(30) NULL,
	DOMICILIO VARCHAR(100),
	TELEFONO NUMBER(9),
	EMAIL VARCHAR2(30) NULL,
	CONSTRAINT pk_cliente4_3 PRIMARY KEY (DNI_CLI)
);

CREATE TABLE VENTA4_3 (
	COD_VENT NUMBER (3),
	FECHA DATE,
	DIN_VEND VARCHAR2(9),
	DIN_CLI VARCHAR2(9),
	CONSTRAINT pk_venta4_3 PRIMARY KEY (COD_VENT),
	CONSTRAINT fk_vendedor4_3 FOREIGN KEY (DNI_VEND) REFERENCES VENDEDOR4_3 (DNI_VEND),
	CONSTRAINT fk_cliente4_3 FOREIGN KEY (DNI_CLI) REFERENCES CLIENTE4_3 (DNI_CLI)
);

CREATE TABLE PRODUCTO4_3 (
	COD_PROD NUMBER (3),
	DESCRIPCION VARCHAR2(200),
	FAMILIA VARCHAR2(30),
	GENERO VARCHAR2(30),
	DESCUENTO NUMBER(2) NULL,
	IVA NUMBER (2),
	CONSTRAINT pk_cliente4_3 PRIMARY KEY (DNI_CLI)
);

CREATE TABLE PRECIO4_3 (
	FECHA DATE,
	PRECIO NUMBER(4),
	COD_PROD NUMBER (3),
	CONSTRAINT pk_precio4_3 PRIMARY KEY (FECHA, COD_PROD),
	CONSTRAINT fk_producto4_3 FOREIGN KEY (COD_PROD) REFERENCES PRODUCTO4_3 (COD_PROD)
);

CREATE TABLE LINEA_VENTA4_3(
	COD_VENT NUMBER (3),
	NUM_LINEA NUMBER (3),
	COD_PROD NUMBER (3),
	FECHA DATE,
	CANTIDAD NUMBER (3),
	CONSTRAINT pk_linea_venta4_3 PRIMARY KEY (COD_VENT, NUM_LINEA),
	CONSTRAINT fk_venta4_3 FOREIGN KEY (COD_VENT) REFERENCES VENTA4_3 (COD_VENT),
	CONSTRAINT fk_precio4_3_1 FOREIGN KEY (COD_PROD, FECHA) REFERENCES PRECIO4_3 (COD_PROD, FECHA)
);

CREATE TABLE DEVOLUCION4_3 (
	COD_VENT NUMBER (3),
	NUM_LINEA NUMBER (3),
	FECHA DATE,
	ESTADO VARCHAR (30),
	TIPO_DEV VARCHAR2 (50),
	CONSTRAINT devolucion4_3 PRIMARY KEY (COD_VENT, NUM_LINEA, FECHA),
	CONSTRAINT fk_linea_venta4_3_1 FOREIGN KEY (COD_VENT, NUM_LINEA) REFERENCES LINEA_VENTA4_3 (COD_VENT, NUM_LINEA)
);