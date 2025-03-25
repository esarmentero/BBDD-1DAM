

DECLARE
    v_filas NUMBER;  -- Declaramos la variable para almacenar el número de filas
BEGIN
    SELECT COUNT(*)
    INTO v_filas      -- guardamos el resultado del selecct en la variable declarada
    FROM productos;
    DBMS_OUTPUT.PUT_LINE('La tabla productos tiene ' || v_filas || ' filas');
END;


