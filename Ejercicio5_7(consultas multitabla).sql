
--CONSULTAS MULTITABLA--
-- 1) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
--productos de la base de datos.

SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id;

--2) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
--productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
--alfabético.

SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
ORDER BY f.nombre ASC;

--3)3) Devuelve una lista con el identificador del producto, nombre del producto, identificador del
--fabricante y nombre del fabricante, de todos los productos de la base de datos.


SELECT p.id , p.nombre , f.id , f.nombre AS fabricante 
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id;

--4) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
--barato.

SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
WHERE p.precio = (SELECT MIN(precio) FROM productos_7);


--5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
--caro.

SELECT p.nombre AS producto , p.precio , f.nombre AS fabircante
FROM productos_7 p 
JOIN fabricantes_7 f ON p.id_fabricante= f.id 
WHERE p.precio = (SELECT MAX(precio) FROM productos_7);


--6) Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT p.nombre AS producto , p.precio , f.nombre AS fabricante 
FROM productos_7 p 
JOIN fabricantes_7 f  ON p.id_fabricante= f.id    
WHERE p.id_fabricante = (SELECT ID FROM FABRICANTES_7 WHERE UPPER(nombre) = UPPER('Lenovo'));

--7) Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor
--que 200€.
SELECT p.nombre AS producto , p.precio , f.nombre AS fabricante 
FROM productos_7 p 
JOIN fabricantes_7 f  ON p.id_fabricante= f.id    
WHERE p.id_fabricante = (SELECT ID FROM FABRICANTES_7 WHERE UPPER(nombre) = UPPER('Crucial'))
AND precio>200;

--8) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett--
--Packardy Seagate. Sin utilizar el operador IN.--

SELECT p.nombre AS Producto 
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id    
WHERE UPPER(f.nombre) = 'ASUS'
   OR UPPER(f.nombre) = 'HEWLETT-PACKARD'
   OR UPPER(f.nombre) = 'SEAGATE';
   
--9)Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-

SELECT  p.nombre , f.nombre AS producto, fabricante
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

--10) Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.--
SELECT p.nombre AS producto, p.precio
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';
--11)Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre AS producto, p.precio
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%';
--12) Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
--productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por
--el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM productos_7 p
JOIN fabricantes_7 f ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;