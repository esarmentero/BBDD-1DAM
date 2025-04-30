--Ej2)
DECLARE
vn1 NUMBER(4,2):=10.1;
vn2 NUMBER(4,2):=20.25;
vn3 NUMBER(4,2):=203.3;
vn4 NUMBER(4,2):=20.41;

BEGIN
DBMS_OUTPUT.PUT_LINE('LA SUMA ES: ' || TO_CHAR(vnt+vn2+vn3+vn4));
END;


--Convertirla a char para poder imprimirla ERROR
--La variable v3 esta mal (203.30 --> 5 cifras en un NUMBER de 4)