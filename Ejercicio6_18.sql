SET SERVEROUTPUT ON;

DECLARE

    vocales NUMBER;
    
    consonante NUMBER;
    
	--Array de vocales
    TYPE vVocales IS VARRAY (5) OF CHAR;
    VARVOCALES vVocales := vVocales('a','e','i','o','u');

	--Array de consonantes
    TYPE vConsonantes IS VARRAY(21) OF CHAR;
    VARCONSONANTES vConsonantes := vConsonantes( 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
        'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'
    );

    resultado VARCHAR2(30) := ' '; --Variable para guardar la frase resultado
    
    numero NUMBER(2);

BEGIN

     numero := &numero;
    
    if  numero > 15 THEN 
        DBMS_OUTPUT.PUT_lINE('El numero debe ser menor o igual a 15');
    END IF;

    FOR i IN 0..numero LOOP
        vocales :=  DBMS_RANDOM.VALUE(1,5); --Generar los aleatorios
        consonante :=  DBMS_RANDOM.VALUE(1,21);
        resultado := resultado || VARVOCALES(vocales) || VARCONSONANTES(consonante); --Concatenarlos en la frase resultado
    END LOOP;
    
    
    DBMS_OUTPUT.PUT_LINE('Resultado después de concatenar aleatoriamente vocales y consonantes -> ' || resultado);


END;