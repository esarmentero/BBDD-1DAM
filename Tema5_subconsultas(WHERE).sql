--Subconsultas (En la clausula where)

--1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

--1º. Subconsulta
SELECT *
FROM PRODUCTOS
WHERE FABRICANTES.ID = (SELECT ID 
						FROM FABRICANTES 
						WHERE NOMBRE = 'Lenovo');

--2º.Condiciones de relacion
SELECT *
FROM PRODUCTOS, FABRICANTES
WHERE productos.id_fabricante = FABRICANTES.ID
AND FABRICANTES.NOMBRE = 'Lenovo';

--3º.Inner join
SELECT *
FROM PRODUCTOS
INNER JOIN FABRICANTES  ON productos.id_fabricante = FABRICANTES.ID
WHERE FABRICANTES.NOMBRE = 'Lenovo';


--2.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM productos
WHERE precio = (SELECT MAX(precio) 
				FROM productos 
				WHERE id_fabricante = (SELECT id 
				FROM fabricantes 
				WHERE nombre = 'Lenovo'));


--3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre, precio
FROM productos
WHERE precio = (SELECT MAX(precio) 
				FROM productos 
				WHERE id_fabricante = (SELECT id 
				FROM fabricantes 
				WHERE nombre = 'Lenovo'));


--4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre, precio
FROM productos
WHERE precio = (SELECT MIN(precio) 
				FROM productos 
				WHERE id_fabricante = (SELECT id 
				FROM fabricantes 
				WHERE nombre = 'Hewlett-Packard'));
			
			
--5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *
FROM PRODUCTOS
WHERE PRECIO >= (SELECT MAX(PRECIO) 
					FROM PRODUCTOS 
					WHERE id_fabricante = (SELECT ID 
					FROM FABRICANTES 
					WHERE NOMBRE = 'Lenovo'));


--6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT *
FROM PRODUCTOS
WHERE id_fabricante = (SELECT ID 
						FROM FABRICANTES 
						WHERE NOMBRE = 'Asus') 
						AND PRECIO >(SELECT AVG (PRECIO) 
									FROM PRODUCTOS 
									WHERE productos.id_fabricante= (SELECT ID 
																	FROM FABRICANTES 
																	WHERE nombre = 'Asus'));