DECLARE
    num1 NUMBER(4,2) := 14.03;
    num2 NUMBER(4,2) := 24.06;
    num3 NUMBER(4,2) := 93.01;
    num4 NUMBER(4,2) := 99.05;
    suma NUMBER(6,2);
BEGIN
    -- Realizamos la suma
    suma := num1 + num2 + num3 + num4;
    
    -- Mostramos el resultado usando PUT_LINE
    DBMS_OUTPUT.PUT_LINE('La suma de los números ' || num1 || ', ' || num2 || ', ' || num3 || ' y ' || num4 || ' es ' || suma);
END;
