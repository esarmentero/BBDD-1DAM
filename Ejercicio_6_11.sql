SET SERVEROUTPUT ON;

--El errer en el programa es que es un bucle infinito, nunca llega a salir porque 
--el contado siempre se incremente y nunca llega a 0.
--Una posible solución es crear un for en el que se controle el número de iteraciones

DECLARE
    vContador NUMBER:=1;
BEGIN
    FOR vContador in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Valor de contador '|| vContador);
    END LOOP;
END;

SET SERVEROUTPUT OFF;