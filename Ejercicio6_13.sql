--13)
--Usando un FOR:
Accept numero prompt 'Introduzca un numero del que quiera saber la tabla de multiplicar';
declare
    numero NUMBER:= '&numero';
    limite_tabla NUMBER:= 10;
    contador NUMBER:= 0;
    resultado NUMBER;
begin
    for contador in 0.. limite_tabla loop
        resultado:= contador*numero;
        DBMS_OUTPUT.PUT_LINE(numero||' * '||contador||' = '||resultado);
    end loop;   
end;

--Usando un WHILE:
Accept numero prompt 'Introduzca un numero del que quiera saber la tabla de multiplicar';
declare
    numero NUMBER:= '&numero';
    limite_tabla NUMBER:= 10;
    contador NUMBER:= 0;
    resultado NUMBER;
begin
    while contador <= limite_tabla loop
        resultado:= contador*numero;
        DBMS_OUTPUT.PUT_LINE(numero||' * '||contador||' = '||resultado);
        contador:= contador + 1;
    end loop;
end;
