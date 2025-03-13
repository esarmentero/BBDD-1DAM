CREATE TABLE PRODUCTO(
CODPRODUCTO NUMBER(5) NOT NULL,
NOMBRE VARCHAR2(40) NOT NULL,
TIPO VARCHAR2(2) NOT NULL,
PRECIOCOSTE NUMBER(5,2) NOT NULL,
PRECIOVENTA NUMBER(5,2) NOT NULL,
IVA NUMBER(2) NOT NULL,
CONSTRAINT pk_PRODUCTO PRIMARY KEY (CODPRODUCTO)
);

CREATE TABLE VENTA(
CODVENTA NUMBER(5) NOT NULL,
FECHA DATE NOT NULL,
CONSTRAINT pk_VENTA PRIMARY KEY(CODVENTA));

CREATE TABLE LINEAVENTA(
CODPRODUCTO NUMBER(5) NOT NULL,
CODVENTA NUMBER(5) NOT NULL,
CANTIDAD NUMBER(2) NOT NULL,
CONSTRAINT pk_lineaventa PRIMARY KEY(CODPRODUCTO,CODVENTA),
CONSTRAINT fk_lineaventa FOREIGN KEY (CODVENTA) REFERENCES VENTA(CODVENTA),
CONSTRAINT fk_linea FOREIGN KEY(CODPRODUCTO) REFERENCES PRODUCTO(CODPRODUCTO)
);

--INSERCION DATOS
INSERT INTO VENTA (codVenta, Fecha) VALUES (10000, '21/02/2024');
INSERT INTO VENTA (codVenta, Fecha) VALUES (10001, '20/02/2024');
INSERT INTO VENTA (codVenta, Fecha) VALUES (10002, '16/03/2024');
INSERT INTO VENTA (codVenta, Fecha) VALUES (10005, '01/01/2024');
INSERT INTO VENTA (codVenta, Fecha) VALUES (10010, '23/02/2024');

INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50000, 'QUESO', 'L', 10.52, 25.63, 10);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50005, 'LECHE', 'L', 10.56, 12.55, 4);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50010, 'HUEVOS', 'H', 26.03, 35.20, 10);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50015, 'CARNE POLLO', 'C', 11.20, 40.90, 2);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50020, 'CARNE TERNERA', 'C', 50.79, 64.52, 4);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50025, 'YOGURT', 'L', 2.56, 7.55, 10);
INSERT INTO PRODUCTO (CodProducto, Nombre, Tipo, precioCoste, precioVenta, iva) VALUES (50030, 'JUDIAS', 'V', 18.90, 20.00, 4);

INSERT INTO LINEAVENTA (CodProducto, codVenta, cantidad) VALUES (50000, 10000, 2);
INSERT INTO LINEAVENTA (CodProducto, codVenta, cantidad) VALUES (50005, 10001, 5);
INSERT INTO LINEAVENTA (CodProducto, codVenta, cantidad) VALUES (50010, 10002, 10);
INSERT INTO LINEAVENTA (CodProducto, codVenta, cantidad) VALUES (50015, 10005, 11);
INSERT INTO LINEAVENTA (CodProducto, codVenta, cantidad) VALUES (50020, 10010, 9);

commit;

-- CONSULTAS

-- a) Productos precio coste menor mitad precio venta 
SELECT count(nombre) FROM producto WHERE preciocoste < precioventa/2;

-- b) Precio mas caro productos con IVA 10
SELECT max(precioventa) FROM producto WHERE iva =10;

-- c) Precio mas barato productos
SELECT min(precioventa) FROM producto;

-- d) Cuantos productos carnicos (TIPO=C) precio coste menor que la tercera parte del precio de venta 
SELECT * FROM producto WHERE tipo = 'C' AND preciocoste < precioventa / 3;  -- Vistamos los datos
SELECT count(*) FROM producto WHERE tipo = 'C' AND preciocoste < precioventa / 3;

-- e) Dinero ganancia productos lacteos tipo L 
SELECT SUM(precioventa - preciocoste) FROM producto WHERE tipo = 'L';

-- f) Media ganancia productos tipo es Lácteo (L), Cárnico (C), Verdura (V) y Hortaliza (H).
SELECT TRUNC ((AVG(precioventa - preciocoste)),2) FROM producto WHERE Tipo IN ('L', 'C', 'V', 'H');

-- g) precios de coste y de venta con un solo decimal de aquellos productos cuyo nombre empieza por L
SELECT TRUNC (preciocoste, 1), TRUNC (precioventa,1) FROM producto WHERE nombre LIKE 'L%';

-- h)  precios de coste redondeados con 1 decimal de aquellos productos cuyo precio de venta es solo un 20% más que el de coste y su tipo el H o L
SELECT TRUNC (preciocoste, 1),precioventa FROM producto WHERE tipo IN ('H', 'L') AND preciocoste < preciocoste * 1.2;

-- i) resto de la división del precio de venta con el de coste para aquellos productos de IVA del 4% y del 10%
SELECT MOD(precioventa, preciocoste) FROM producto WHERE iva IN (4, 10);

-- j) cuantas ventas se han realizado. Como cada fila que hay en la tabla Venta representa una venta, basta con contar el número de filas que tiene esa tabla.
SELECT count(*) FROM lineaventa;

-- k) Mostrar el nombre de los productos de tipo L, transformando su nombre a minúsculas.
SELECT lower(nombre) FROM producto WHERE tipo = 'L';

