CREATE OR REPLACE PROCEDURE quitar_espacios (p_cadena IN VARCHAR2) IS

    v_sin_espacios VARCHAR2(100);
    
BEGIN
    --Reemplazar todos los espacios
    v_sin_espacios := REPLACE(p_cadena, ' ', '');

    --Mostrar la variable
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_sin_espacios);
END;