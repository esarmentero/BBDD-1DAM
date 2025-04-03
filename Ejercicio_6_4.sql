--6.4
SET SERVEROUTPUT ON;
ACCEPT calle1 PROMPT 'Introduzca la calle 1: ';
ACCEPT calle2 PROMPT 'Introduzca la calle 2: ';
ACCEPT calle3 PROMPT 'Introduzca la calle 3: ';
ACCEPT calle4 PROMPT 'Introduzca la calle 4: ';

DECLARE

v_calle1 VARCHAR2(70):= '&calle1';
v_calle2 VARCHAR2(70):= '&calle2';
v_calle3 VARCHAR2(70):= '&calle3';
v_calle4 VARCHAR2(70):= '&calle4';

BEGIN
    DBMS_OUTPUT.put_line('El domicilio: '||v_calle1);
    v_calle1 := upper(v_calle1);
    v_calle1 := replace(v_calle1,' ','');
    DBMS_OUTPUT.put_line('Se ha convertido en: '||v_calle1);
    DBMS_OUTPUT.put_line('');
    
    DBMS_OUTPUT.put_line('El domicilio: '||v_calle2);
    v_calle2 := upper(v_calle2);
    v_calle2 := replace(v_calle2,' ','');
    DBMS_OUTPUT.put_line('Se ha convertido en: '||v_calle2);
    DBMS_OUTPUT.put_line('');
    
    DBMS_OUTPUT.put_line('El domicilio: '||v_calle3);
    v_calle3 := upper(v_calle3);
    v_calle3 := replace(v_calle3,' ','');
    DBMS_OUTPUT.put_line('Se ha convertido en: '||v_calle3);
    DBMS_OUTPUT.put_line('');
    
    DBMS_OUTPUT.put_line('El domicilio: '||v_calle4);
    v_calle4 := upper(v_calle4);
    v_calle4 := replace(v_calle4,' ','');
    DBMS_OUTPUT.put_line('Se ha convertido en: '||v_calle4);
END;