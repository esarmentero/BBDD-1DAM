accept cadena prompt 'Introduce la dacena: ';
declare
    v_cadena varchar(30):='&cadena';
begin
    DBMS_OUTPUT.PUT_LINE('La cadena en mayusculas es: '|| UPPER(v_cadena));
    DBMS_OUTPUT.PUT_LINE('La cadena en mayusculas es: '|| LOWER(v_cadena));
end;