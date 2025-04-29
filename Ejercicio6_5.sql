--6.5 Realizar un procedimiento PL/SQL trabajado sobre las tablas PRODUCTOS, FABRICANTES que muestre por
--pantalla el producto más caro de todos los que contiene la tabla y el fabricante al que corresponde.



SET SERVEROUTPUT ON

DECLARE
  v_nombre_producto VARCHAR2(100);
  v_precio NUMBER(6,2);
  v_nombre_fabricante VARCHAR2(100);
BEGIN
  SELECT p.nombre, p.precio, f.nombre
  INTO v_nombre_producto, v_precio, v_nombre_fabricante
  FROM productos, p fabricantes f WHERE p.id_fabricante = f.id
  AND p.precio = (SELECT MAX(precio) FROM productos);
  
  DBMS_OUTPUT.PUT_LINE('El producto más caro es: ' || v_nombre_producto || ' y su fabricante es: ' || v_nombre_fabricante);
END;
