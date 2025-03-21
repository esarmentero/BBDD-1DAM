--A
SELECT MAX(PRECIO)
FROM LIBRO;
--B
SELECT MIN(PRECIO)
FROM LIBRO;
--C
SELECT MIN(FECHA_SAL)
FROM EDITA E
WHERE E.DNI like '443042293%';
--D
SELECT MAX(FECHA_SAL)
FROM EDITA E
WHERE E.DNI like '29110302%';
--E
SELECT MAX(NUMPAG)
FROM LIBRO
WHERE TEMATICA='NOVELA';
--F
SELECT MIN(NUMPAG)
FROM LIBRO
WHERE TEMATICA IN ('NOVELA','INFANTIL', 'CIENTIFICA','COMICO');
--G
SELECT COUNT(*)
FROM LIBRO L
WHERE L.TEMATICA='CIENTIFICO'
AND L.PRECIO BETWEEN 5 AND 15;
