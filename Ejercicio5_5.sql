--a. Mostrar el DNI de los empleados que son de Barcelona, Madrid, Sevilla o Málaga, que no
--se llaman ni Antonio ni Luis y que su primer apellido es García.

SELECT DNI
FROM empleado
WHERE CIUDAD IN('BARCELONA','MADRID','SEVILLA','MALAGA')
 AND NOMBRE DISTINCT('ANTONIO','LUIS') 
 AND PRAPELLIDO = 'GARCIA';

--b. Mostrar el DNI de los empleados que no son de Sevilla, pero sí son de Barcelona o de
--Madrid y que la primera letra del nombre es una M.

SELECT DNI
FROM empleado
WHERE CIUDAD DISTINCT FROM 'SEVILLA'
 AND CIUDAD IN('BARCELONA','MADRID')
 AND NOMBRE LIKE ('M*');
 
 --c. Mostar el DNI de los empleados que son de Sevilla, pero no son de Barcelona o de Madrid
--y que la primera letra de su nombre no es una M.

SELECT DNI
FROM empleado
WHERE CIUDAD DISTINCT('SEVILLA','BARCELONA','MADRID')
 AND NOMBRE DISTINCT LIKE ('M*');

--d. Mostrar el nombre y el primer apellido de aquellos empleados que viven en Valencia o
--Vizcaya o en una ciudad cuya última letra sea “a” ordenados descendentemente por el
--primer apellido.

SELECT NOMBRE,PRAPELLIDO
FROM empleado 
WHERE CIUDAD IN('VALENCIA','VIZCAYA')
 OR CIUDAD LIKE '*a'
 ORDER BY PRAPELLIDO DESC;
 
--e. Mostrar el DNI de aquellos empleados que son de Barcelona y que se llaman Antonio, Luis,
--Iván o Pedro y que se apellidan García o Cantos.

SELECT DNI
FROM empleado
WHERE CIUDAD = 'BARCELONA'
 AND NOMBRE IN('ANTONIO','LUIS','RAMON','ANTONIO'
 AND PRAPELLIDO IN('GARCIA','CANTOS');

--f. Mostrar el nombre y los apellidos de los empleados cuyo DNI contenga un 4 y el nombre
--sea Rosa, Luis, Ramón o Antonio, ordenados descendentemente por el primer apellido.

SELECT NOMBRE,PRAPELLIDO,SGAPELLIDO
FROM empleado
WHERE DNI LIKE (%4%)
 AND NOMBRE IN('ROSA','LUIS','RAMON','ANTONIO')
 ORDER BY PRAPELLIDO DESC;

--g. Mostar el DNI de los empleados que se llaman Antonio y que su primer apellido no
--contenga la letra c y su segundo apellido sea García, Gómez o Sánchez, ordenador por el
--segundo apellido.

SELECT DNI
FROM empleado
WHERE NOMBRE = 'ANTONIO',
 AND PRAPELLIDO DISTINCT 
 AND SGAPELLIDO IN('GARCIA','GOMEZ','SANCHEZ')
 ORDER BY SGAPELLIDO;

--h. Mostrar el DNI de aquellos empleados que no tengan segundo apellido.

SELECT DNI
FROM empleado
WHERE SGAPELLIDO = NULL;