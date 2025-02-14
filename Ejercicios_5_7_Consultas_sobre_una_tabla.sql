--CONSULTAS SOBRE UNA TABLA
--a. Lista el nombre de todos los productos que hay en la tabla producto. 
SELECT NOMBRE 
FROM PRODUCTOS;

--b. Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT NOMBRE AS "Nombre de producto", PRECIO AS "Euros"
FROM PRODUCTOS;

--c. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a mayúscula. 
SELECT UPPER(NOMBRE), PRECIO
FROM PRODUCTOS;

--d. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a minúscula. 
SELECT LOWER(NOMBRE), PRECIO
FROM PRODUCTOS;

--e. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el 
--valor del precio. 
SELECT NOMBRE, ROUND(PRECIO)
FROM PRODUCTOS;

--f. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor 
--del precio para mostrarlo sin ninguna cifra decimal. 
SELECT NOMBRE, TRUNC(PRECIO)
FROM PRODUCTOS;

--g. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT ID_FABRICANTE
FROM PRODUCTOS;

--h. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando 
--los identificadores que aparecen repetidos.
SELECT DISTINCT ID_FABRICANTE
FROM PRODUCTOS;

--i. Lista los nombres de los fabricantes ordenados de forma ascendente. 
SELECT NOMBRE
FROM FABRICANTES
ORDER BY NOMBRE ASC;

--j. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER 
--BY y LIMIT) 
SELECT NOMBRE, PRECIO
FROM (SELECT * FROM PRODUCTOS ORDER BY PRECIO DESC)
WHERE ROWNUM = 1;

--k. Lista el nombre de los productos que tienen un precio mayor o igual a 400€. +
SELECT NOMBRE
FROM PRODUCTOS
WHERE PRECIO >= 400;

--l. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE
FROM PRODUCTOS
WHERE PRECIO < 400;

--m. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el 
--operador BETWEEN. 
SELECT NOMBRE
FROM PRODUCTOS
WHERE PRECIO >= 80 AND PRECIO <= 300;

--n. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el 
--operador BETWEEN. 
SELECT NOMBRE
FROM PRODUCTOS
WHERE PRECIO BETWEEN 60 AND 200;

--o. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de 
--fabricante sea igual a 6. 
SELECT NOMBRE
FROM PRODUCTOS
WHERE PRECIO >= 200 AND ID_FABRICANTE = 6;

--p. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el 
--operador IN. 
SELECT NOMBRE
FROM PRODUCTOS
WHERE ID_FABRICANTE IN (1, 3, 5);

--q. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. 
SELECT NOMBRE
FROM FABRICANTES
WHERE NOMBRE LIKE 'S%';

--r. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE
FROM FABRICANTES
WHERE NOMBRE LIKE '%e';

--s. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT NOMBRE
FROM FABRICANTES
WHERE NOMBRE LIKE '%w%';
