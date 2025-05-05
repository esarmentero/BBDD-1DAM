--Crear tabla
CREATE TABLE tblEmpleadoAux (
    CodEmp NUMBER(5),
    Nombre VARCHAR2(30),
    Ape1 VARCHAR2(30),
    Ape2 VARCHAR2(30)
);

SET SERVEROUTPUT ON;

DECLARE

    --Declarar las variables a usar
    v_num_registros NUMBER(2);
    v_cod_empleado tblEmpleadoAux.CodEmp%TYPE;
    v_nombre tblEmpleadoAux.Nombre%TYPE;
    v_ape1 tblEmpleadoAux.Ape1%TYPE;
    v_ape2 tblEmpleadoAux.Ape2%TYPE;

BEGIN 
    --Solicitar en número de registros, n, que se quiere introducir en la tabla.
    v_num_registros :=&registros;

    --Solicitar los datos de esos n empleados e introducirlos en dicha tabla usando el comando FOR.
    FOR i IN 1..v_num_registros LOOP

        --Solicitar datos
        v_cod_empleado := '&codigo_empleado';
        v_nombre := '&nombre_empleado';
        v_ape1 := '&apellido1_empleado';
        v_ape2 := '&apellido2_empleado';

        --Insertarlos en la tabla
        INSERT INTO tblEmpleadoAux (CodEmp, Nombre, Ape1, Ape2)
        VALUES (v_cod_empleado, v_nombre, v_ape1, v_ape2);

    END LOOP;

END;