--RECIBE NUM REAL, REPRESENTA VALOR Y MUESTRA MENSAJE--
SET SERVEROUTPUT ON

    -- CASO 1 --
DECLARE
    v_nota NUMBER := &nota;
    v_mensaje VARCHAR2(20);
BEGIN
    IF v_nota >= 0 AND v_nota < 5 THEN
        v_mensaje := 'Insuficiente';
    ELSIF v_nota >= 5 AND v_nota < 6 THEN
        v_mensaje := 'Aprobado';
    ELSIF v_nota >= 6 AND v_nota < 7 THEN
        v_mensaje := 'Bien';
END IF;
    DBMS_OUTPUT.PUT_LINE(v_mensaje);
END;

    -- CASO 2 --
DECLARE
    v_nota NUMBER := &nota;
    v_mensaje VARCHAR2(20);
BEGIN
    v_mensaje := CASE 
        WHEN v_nota >= 0 AND v_nota < 5 THEN 'INSUFICIENTE'
        WHEN v_nota >= 5 AND v_nota < 6 THEN 'APROBADO'
        WHEN v_nota >= 6 AND v_nota < 7 THEN 'BIEN'
        ELSE 'NO VALE'
    END;
    DBMS_OUTPUT.PUT_LINE(v_mensaje);
END;
