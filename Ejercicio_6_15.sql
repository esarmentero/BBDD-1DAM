--6.15
SET SERVEROUTPUT ON;

DECLARE

TYPE rComponentes IS RECORD (
    NOMBREPRODUCTO PRODUCTOS.NOMBRE%TYPE,
    NOMBREFABRICANTE FABRICANTES.NOMBRE%TYPE,
    CATEGORIA VARCHAR2(20)
);

vComponente1 rComponentes;
--vComponente2 rComponentes;
--vComponente3 rComponentes;

vResultado NUMBER (2);
vResultado2_1 CHAR (1);
vResultado2_2 VARCHAR2(20);

BEGIN
    
    -- INICIALIZAR RECORD A MANO:
    vComponente1.nombreproducto := 'Impresora Profesional 769XM';
    vComponente1.nombrefabricante := 'ASUS';
    vComponente1.categoria := 'Tarjetas de red';
    
    SELECT COUNT(PRODUCTOS.NOMBRE)
    INTO vResultado
    FROM FABRICANTES, PRODUCTOS
    WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE
    AND UPPER(FABRICANTES.NOMBRE) = vComponente1.nombrefabricante;
    
    DBMS_OUTPUT.put_line('El numero de productos de ASUS es: '||vResultado);
    
    --
    
    vResultado2_1 := SUBSTR(vComponente1.nombreproducto, 1, 1);
    
    SELECT COUNT(PRODUCTOS.NOMBRE)
    INTO vResultado2_2
    FROM PRODUCTOS
    WHERE UPPER(NOMBRE) LIKE '%'||vResultado2_1||'%';
    
    DBMS_OUTPUT.put_line('El numero de productos que contienen "i": '||vResultado2_2);
END;