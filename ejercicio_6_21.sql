
-- EJ 6.21 Atraves del DNI elimina al conductor y sus matriculas 

SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE eliminar_conductor (
    p_dni IN CHAR
)
IS
    
BEGIN 
    
    DELETE FROM CONDUCTOR
    WHERE DNI = p_dni;
    dbms_output.put_line('Conductor y sus viajes eliminados correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error al eliminar. ');
END;


BEGIN 
    eliminar_conductor('31207982H');
END;


-- INSERT INTO CONDUCTOR(DNI, NOMBRE, APELLIDO1, APELLIDO2, NUM_EMPLEADO)
-- VALUES('31207982H', 'MARCO', 'GARCIA', 'DIAZ', 669874);
