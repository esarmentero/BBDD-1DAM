SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION valores_fila (num_fila NUMBER) 
RETURN VARCHAR2 
IS
    --Declaramos un record para que almacene los valores de la fila
    TYPE rFila IS RECORD (
        v_id productos.id%TYPE, 
        v_nombre productos.nombre%TYPE,
        v_precio productos.precio%TYPE,
        v_idFabricante productos.id_fabricante%TYPE
    );
    
    vFila rFila;
    vFinal VARCHAR2(200);
BEGIN
    --Obtenemos la fila correspondiente
    SELECT v_id, v_nombre, v_precio, v_idFabricante 
    INTO vFila
    FROM (
        SELECT id AS v_id, nombre AS v_nombre, precio AS v_precio, id_fabricante AS v_idFabricante,
               ROWNUM AS rn
        FROM productos
    )
    WHERE rn = num_fila;

    --Concatenamos todo los campos en una única variable
    vFinal := vFila.v_id || ', ' || vFila.v_nombre || ', ' || 
              vFila.v_precio || ', ' || vFila.v_idFabricante;

    RETURN vFinal;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No se encontró la fila';
END;

DECLARE
    fila NUMBER(2);
    resultado VARCHAR2(200);
BEGIN 
    fila:=4;
    resultado:=valores_fila(fila);
    
    dbms_output.put_line(resultado);
END;


--Devolver la variable concatenada en varias variables
DECLARE
    resultado VARCHAR2(100);
    v_pos1 NUMBER;
    v_pos2 NUMBER;
    v_pos3 NUMBER; 
    v_id VARCHAR2(100);   
    v_nombre VARCHAR2(100);   
    v_precio VARCHAR2(100);
    v_fabricante VARCHAR2(100);


BEGIN
    resultado:=valores_fila(5);

    -- Sirve para encontrar la posición de los separadores.
    -- Ejemplo INSTR('123:342:545', ':') --> devuelve la posición del primer separador
    -- SELECT INSTR('123:342:545', ':') FROM DUAL; --> devuelve la posición del primer separador
    -- SELECT INSTR('123:342:545', ':', 1. 2) FROM DUAL; --> devuelve la posición del segundo separador empezando po el caracter 1

    v_pos1:=INSTR(resultado, ',', 1, 1);
    v_pos2:=INSTR(resultado, ',', 1, 2); --Empieza desde el 1 y encuentra la segunda coma que se encuentra
    v_pos3:=INSTR(resultado, ',', 1, 3);

    dbms_output.put_line(v_pos1 || v_pos2 || v_pos1);       --Aqui se muestran las posiciones de los separadores

    v_id:=SUBSTR(resultado, 1, (v_pos1 -1));
    v_nombre:=SUBSTR(resultado, (v_pos1 + 1), (v_pos2 - v_pos1 - 1));
    v_precio:=SUBSTR(resultado, (v_pos2 + 1), (v_pos3 - v_pos2 - 1));
    v_fabricante:=SUBSTR(resultado, v_pos3 + 1));

    dbms_output.put_line(v_id);
    dbms_output.put_line(v_nombre);
    dbms_output.put_line(v_precio);
    dbms_output.put_line(v_fabricante);
END;
