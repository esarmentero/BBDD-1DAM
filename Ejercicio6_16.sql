6.16--Crea un bloque PL/SQL con una variable tipo tabla llamada TASA_IMPUESTOS que está compuesta
--por números con dos decimales colocados en columna para informar los valores de las diferentes tasas.
--Inicializa el valor de la primera tasa con 12.45, el de la segunda tasa 34.90, el de la tercera tasa con 44.00
--y la cuarta tasa con 30.21. Recuerda que para acceder a las diferentes filas hay que indicar el número
--de la fila.

SET SERVEROUTPUT ON

DECLARE
    TYPE TASA_IMPUESTOS IS TABLE OF  NUMBER(4,2) INDEX BY BINARY_INTEGER;
    
    vTasaImpuestos TASA_IMPUESTOS;
BEGIN
    vTasaImpuestos(1):=12.45;
    vTasaImpuestos(2):=34.90;
    vTasaImpuestos(3):=44.00;
    vTasaImpuestos(4):=30.21;
    
    FOR i IN vTasaImpuestos.FIRST..vTasaImpuestos.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(vTasaImpuestos(i));
    END LOOP;

END;