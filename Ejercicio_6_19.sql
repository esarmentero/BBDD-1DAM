SET SERVEROUTPUT ON;

DECLARE
    
    TYPE T_PRUEBA IS TABLE OF VARCHAR2(100) INDEX BY VARCHAR2(50);
    V_PRUEBA T_PRUEBA;
    
BEGIN
    
    V_PRUEBA('A01'):='Hola';
    V_PRUEBA('A02'):='Que';
    V_PRUEBA('A03'):='Tal';
    V_PRUEBA('A04'):='Estas';
    
    DBMS_OUTPUT.PUT_LINE(V_PRUEBA('A01')||V_PRUEBA('A02')||V_PRUEBA('A03')||V_PRUEBA('A04'));
    
END;

--Si se podría, ya que con el index by varchar2(50) puedes indexar 
--con palabras de hasta 50 caracteres en vez de con números.