DECLARE
    
    TYPE numHijos IS VARRAY (10) OF VARCHAR2(10);
    
    vNumHijos numHijos:=numHijos('Eva','Lucia','Juan');

BEGIN

    vNumHijos.EXTEND(7);
    
    vNumHijos(9):='David';
    
    FOR i IN vNumHijos.first..vNumHijos.last LOOP
        dbms_output.put_line(vNumHijos(i));
    END LOOP;

END;