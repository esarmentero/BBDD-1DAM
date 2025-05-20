--EJ6.24
--Ejercicio sin el procedimiento
DECLARE
    mensaje varchar2(30) := 'Hola Mundo';
    cantidad_vocales NUMBER := 0;
BEGIN
    FOR i IN 1..LENGTH(mensaje) LOOP
        IF(LOWER(SUBSTR(mensaje, i, 1)) IN ('a', 'e', 'i', 'o', 'u'))THEN
            cantidad_vocales := cantidad_vocales + 1;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Numero de vocales: ' || cantidad_vocales);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR'); 
END;

--Procedimiento
CREATE OR REPLACE PROCEDURE conteo_vocales(
    mensaje IN VARCHAR2,
    cantidad_vocales OUT NUMBER
)IS
BEGIN
    cantidad_vocales := 0;
    FOR i IN 1..LENGTH(mensaje) LOOP
        IF(LOWER(SUBSTR(mensaje, i, 1)) IN ('a', 'e', 'i', 'o', 'u'))THEN
            cantidad_vocales := cantidad_vocales + 1;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Numero de vocales: ' || cantidad_vocales);
EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR'); 
END;

--Prueba
DECLARE
    cantidad_vocales NUMBER;
BEGIN
    conteo_vocales('Texto de ejemplo', cantidad_vocales);
END;