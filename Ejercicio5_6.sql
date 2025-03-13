--A
--Enunciado:
SELECT dni 
FROM Profesor P, Departamento D
WHERE D.nombre='Informatica y Comunicaciones'
AND D.CodDep=P.CodDep;

--Join on:
SELECT P.dni 
FROM Profesor P
JOIN Departamento D ON P.CodDep = D.CodDep
WHERE D.nombre = 'Informatica y Comunicaciones';

--Using on:
SELECT dni 
FROM Profesor P
JOIN Departamento D USING (CodDep)
WHERE D.nombre = 'Informatica y Comunicaciones';


--B
--Enunciado: 
SELECT Nombre, prApellido 
FROM Alumno A, AlumBil B
WHERE UPPER (lugar) IN ('MADRID', 'BARCELONA') 
AND A.dni=B.dni;

--Join on:
SELECT Nombre, prApellido 
FROM Alumno A
JOIN AlumBil B ON A.dni=B.dni
WHERE UPPER (B.lugar) IN ('MADRID', 'BARCELONA');

--Using on:
SELECT Nombre, prApellido 
FROM Alumno 
JOIN AlumBil USING (dni)
WHERE UPPER(lugar) IN ('MADRID', 'BARCELONA');


--C
--Enunciado: 
SELECT Al.Nombre, Al.prApellido, Al.sgApellido
FROM Alumno Al, Matricula M, Asignatura Ag
WHERE UPPER(Ag.Nombre) IN ('BASES DE DATOS', 'ACCESO A DATOS')
AND Al.dni=M.dni AND M.CodAsig=Ag.CodAsig;

--Join on:
SELECT Al.Nombre, Al.prApellido, Al.sgApellido
FROM Alumno Al JOIN Matricula M ON Al.dni=M.dni
JOIN Asignatura Ag ON M.CodAsig=Ag.CodAsig
WHERE UPPER(Ag.Nombre) IN ('BASES DE DATOS', 'ACCESO A DATOS');

--Using on:
SELECT Nombre, prApellido, sgApellido
FROM Alumno 
JOIN Matricula USING (dni)
JOIN Asignatura USING (CodAsig)
WHERE UPPER(Nombre) IN ('BASES DE DATOS', 'ACCESO A DATOS');

--D
--Enunciado: 
SELECT Alumno.Nombre, prApellido, sgApellido
FROM Alumno Al, Matricula M, Asignatura Ag, Ciclo C
WHERE Siglas='DAM' AND nota>=5
AND Al.dni=M.dni AND M.CodAsig=Ag.CodAsig
AND Ag.CodCF=C.CodCF;

--Join on:
SELECT Alumno.Nombre, prApellido, sgApellido
FROM Alumno Al JOIN Matricula M ON Al.dni=M.dni
JOIN Asignatura Ag ON M.CodAsig=Ag.CodAsig
JOIN Ciclo C ON Ag.CodCF = C.CodCF
WHERE Siglas='DAM' AND nota>=5;

--Using on:
SELECT Nombre, prApellido, sgApellido
FROM Alumno
JOIN Matricula USING (dni)
JOIN Asignatura USING (CodAsig)
JOIN Ciclo USING (CodCF)
WHERE Siglas = 'DAM' AND nota >= 5;

--E
--Enunciado
SELECT Ag. Nombre
FROM Alumno Al, Matricula M, Asignatura Ag, Ciclo C, Profesor P, Imparte I, Departamento D
WHERE NH>100 AND Siglas='DAM' AND Ciclo.Nombre='Informática y Comunicaciones' And M.curso=2023
AND Ag.CodAsig=I.CodASig AND I.dni=P.dni AND P.CodDep=D.CodDep
AND Al.dni=M.dni AND M.CodAsig=Ag.CodAsig AND Ag.CodCF=C.CodCF;

--Join on:
SELECT Ag.Nombre
FROM Profesor P
JOIN Departamento D ON P.CodDep = D.CodDep
JOIN Imparte I ON I.dni = P.dni
JOIN Asignatura Ag ON Ag.CodAsig = I.CodAsig
JOIN Matricula M ON M.CodAsig = Ag.CodAsig
JOIN Alumno Al ON M.dni = Al.dni  
JOIN Ciclo C ON Ag.CodCF = C.CodCF
WHERE Ag.NH > 100 
AND C.Siglas = 'DAM' 
AND C.Nombre = 'Informática y Comunicaciones' 
AND M.curso = 2023;

--Using on:
SELECT Ag.Nombre
FROM Profesor
JOIN Departamento USING (CodDep)
JOIN Imparte USING (dni)
JOIN Asignatura USING (CodAsig)
JOIN Matricula USING (CodAsig)
JOIN Alumno USING (dni)
JOIN Ciclo USING (CodCF)
WHERE Ag.NH > 100 
AND C.Siglas = 'DAM' 
AND C.Nombre = 'Informática y Comunicaciones' 
AND M.curso = 2023;