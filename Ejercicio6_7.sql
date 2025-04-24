DECLARE
    vCodigo NUMBER := 1;
    APROBADOS NUMBER;
    ALUMNOS_TOTALES NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO APROBADOS 
    FROM ASIGNATURA 
    WHERE CodAsig = vCodigo AND NOTA >= 5;
   
    SELECT COUNT(*) 
    INTO ALUMNOS_TOTALES 
    FROM ASIGNATURA 
    WHERE CODASIG = VCODIGO;
   
    IF APROBADOS >= (85 * ALUMNOS_TOTALES / 100) THEN
        DBMS_OUTPUT.PUT_LINE('La evaluación de la asignatura con código 1 tiene muy buenos resultados');
    ELSIF APROBADOS >= (70 * ALUMNOS_TOTALES / 100) THEN
        DBMS_OUTPUT.PUT_LINE('La evaluación de la asignatura con código 1 no tiene malos resultados');
    ELSIF APROBADOS >= (50 * ALUMNOS_TOTALES / 100) THEN
        DBMS_OUTPUT.PUT_LINE('La evaluación de la asignatura con código 1 podría estar mejor');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('La evaluación de la asignatura con código 1 tiene malos resultados');
    END IF;
END;