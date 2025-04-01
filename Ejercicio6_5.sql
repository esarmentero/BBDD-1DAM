--6.5 Realizar un procedimiento PL/SQL trabajado sobre las tablas PRODUCTOS, FABRICANTES que muestre por
--pantalla el producto más caro de todos los que contiene la tabla y el fabricante al que corresponde.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE producto_mas_caro IS
  v_precio_maximo productos.precio%TYPE;
  v_nombre_producto productos.nombre%TYPE;
  v_nombre_fabricante fabricantes.nombre%TYPE;
BEGIN
    SELECT MAX(precio), nombre, f.nombre
    INTO v_precio_maximo, v_nombre_producto, v_nombre_fabricante
    FROM productos p
    JOIN fabricantes f
    ON p.id_fabricante = f.id;
    
    DBMS_OUTPUT.PUT_LINE('El producto más caro es ' || v_nombre_producto || ' y pertenece al fabricante ' || v_nombre_fabricante);
END;
